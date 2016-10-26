class Aggregator < Thor
  module Errors

    class BaseError < StandardError
      attr_accessor :message

      def initialize(attributes = {})
        attributes.each do |name, value|
          public_send("#{name}=", value)
        end
      end
    end

    class ExtractError < BaseError; end
  end
end
