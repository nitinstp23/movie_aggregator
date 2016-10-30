class Aggregator < Thor
  module Formats
    class Text < Base
      include Extractable

      private

      def append(data_string)
        log = Aggregator::Log.instance
        log.info("Writing to a #{name} file")

        File.open(file_path, 'w') do |file|
          file << data_string
        end
      rescue IOError => ex
        raise ::Aggregator::Errors::ExtractError.new(message: "Error while writing to #{name} file")
      end

      def file_path
        "#{Aggregator::Constants::SETTINGS['exported_file_path']}/#{name}.txt"
      end

    end
  end
end
