class Aggregator < Thor
  module Formats
    class Text < Thor
      class SourceFile
        def initialize(data_string = {})
          @data_string = data_string
        end

        def append
          write_to_file
        rescue IOError => ex
          raise ::Aggregator::Errors::ExtractError.new(message: 'Error while writing to Text file')
        end

        private

        def filename
          "#{Aggregator::Constants::SETTINGS['exported_filename']}.txt"
        end

        def write_to_file
          log = Aggregator::Log.instance
          log.info('Writing to a TEXT file...')
          log.info(@data_string)

          # code for writing to a text file goes here...
        end
      end
    end
  end
end
