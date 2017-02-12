$LOAD_PATH << File.join(File.dirname(__FILE__), "lib")

# frozen_string_literal: true
require "shorten/app"

run Shorten::App.new
