# frozen_string_literal: true
require "sinatra"
require "sinatra/base"
require "sinatra/contrib"
require "json"
require "puma"

require "shorten/helpers/generator"

module Shorten
  class App < Sinatra::Base
    helpers Helpers::Generator

    set :root,  File.expand_path("../../../", __FILE__)
    set :cache, {}

    before do
      request.path_info.sub! %r{/$}, ""
    end

    get "/" do
      erb :index
    end

    get "/urls" do
      content_type :json
      settings.cache.to_json
    end

    get "/status" do
      content_type :json
      {
        :status => 200
      }.to_json
    end

    get "/:url" do
      redirect settings.cache[params[:url]]
    end

    post "/url" do
      request.body.rewind
      data = JSON.parse request.body.read

      short_url = create_short_url
      long_url = data["url"]

      settings.cache[short_url] = long_url

      content_type :json
      {
        :short_url => short_url,
        :long_url  => long_url
      }.to_json
    end
  end
end
