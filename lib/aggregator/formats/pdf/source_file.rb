class Aggregator < Thor
  module Formats
    class Pdf < Thor
      class SourceFile
        def initialize(data_string = {})
          @data_string = data_string
        end

        def append
          write_to_file
        rescue IOError => ex
          raise ::Aggregator::Errors::ExtractError.new(message: 'Error while writing to PDF file')
        end

        private

        def filename
          "#{Aggregator::Constants::SETTINGS['exported_filename']}.pdf"
        end

        def write_to_file
          log = Aggregator::Log.instance
          log.info('Writing to a PDF file...')
          log.info(@data_string)

          # code for writing to a pdf file goes here...
        end
      end
    end
  end
end
