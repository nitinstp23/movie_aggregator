require 'prawn'

class Aggregator < Thor
  module Formats
    class Pdf < Base
      include Extractable

      private

      def append(data_string)
        log = Aggregator::Log.instance
        log.info("Writing to a #{name} file")

        Prawn::Document.generate(file_path) do
          text data_string
        end
      rescue => ex # Rescuing from StandardError as Prawn doesn't defines a base error class
        raise ::Aggregator::Errors::ExtractError.new(message: "Error while writing to #{name} file")
      end

      def file_path
        "#{Aggregator::Constants::SETTINGS['exported_file_path']}/#{name}.pdf"
      end

    end
  end
end
