# frozen_string_literal: true
module Shorten
  module Helpers
    module Generator
      def create_short_url
        charset = Array("A".."Z") + Array("a".."z")
        intset = Array(1..9) + Array(1..9)
        chars = Array.new(4) { charset.sample }.join
        ints = Array.new(4) { intset.sample }.join
        chars + ints.to_s
      end
    end
  end
end
