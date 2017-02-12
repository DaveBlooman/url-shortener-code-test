# frozen_string_literal: true
require_relative "spec_helper"
require "shorten/app"

describe Shorten::App do
  include Rack::Test::Methods

  let(:app) { Shorten::App.new }
  let(:post_body) do
    {
      :url => "https://www.farmdrop.com/"
    }.to_json
  end

  describe "status endpoint" do
    before { get "/status" }
    specify { expect(last_response.status).to eq 200 }
  end

  describe "post endpoint `/url`" do
    let(:regex) do
      /^(?=(?:.*?[A-Za-z]){4})(?=(?:.*?[0-9]){4})[A-Za-z0-9#,.\-_]{8,}$/
    end

    before do
      post "/url", post_body, "CONTENT_TYPE" => "application/json"
    end

    let(:short_url_format) do
      JSON.parse(last_response.body.strip)["short_url"]
    end

    specify { expect(last_response.status).to eq 200 }
    specify { expect(short_url_format).to match regex }
  end

  describe "get endpoint `/:url`" do
    let(:url) { "https://www.farmdrop.com/" }

    before do
      post "/url", post_body, "CONTENT_TYPE" => "application/json"
      id = JSON.parse(last_response.body.strip)["short_url"]
      get "/#{id}"
    end

    specify { expect(last_response.location).to eql(url) }
    specify { expect(last_response).to be_redirect }
  end
end
