class Aggregator < Thor
  module Formats
    class Base < Thor

      desc 'extract', 'Extract movie details to pdf'
      option :name, type: :string, required: true
      option :time, type: :string, required: true
      option :lang, type: :string, required: true
      option :actor, type: :string, required: true
      option :genre, type: :string, required: true
      def extract
        log = ::Aggregator::Log.instance
        log.info("START #{name} extract")

        data_string = ::Aggregator::MovieDetail.new(options).to_s

        append(data_string)

        log.info("STOP #{name} extract")
      rescue NotImplementedError, ::Aggregator::Errors::ExtractError => ex
        log.error(ex)

        if options[:debug]
          log.debug(ex.backtrace.join("\n"))
        end
      end

      private

      def name
        @name ||= self.class.name.demodulize.downcase
      end

      def append(*)
        raise NotImplementedError, "#{name} should define :append method"
      end

    end
  end
end
