require_relative 'pdf/source_file'

class Aggregator < Thor
  module Formats
    class Pdf < Thor
      include Extractable

      desc 'extract', 'Extract movie details to pdf'
      option :name, type: :string, required: true
      option :time, type: :string, required: true
      option :lang, type: :string, required: true
      option :actor, type: :string, required: true
      option :genre, type: :string, required: true
      def extract
        log = Aggregator::Log.instance
        log.info('START PDF extract')

        data_string = ::Aggregator::MovieDetail.new(options).to_s

        Pdf::SourceFile.new(data_string).append

        log.info('STOP PDF extract')
      rescue ::Aggregator::Errors::ExtractError => ex
        log.error(ex)

        if options[:debug]
          log.debug(ex.backtrace.join("\n"))
        end
      end

    end
  end
end
