# frozen_string_literal: true
$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "lib")
$LOAD_PATH << File.join(File.dirname(__FILE__))

ENV["RACK_ENV"] = "test"

require "pry"
require "rack/test"
