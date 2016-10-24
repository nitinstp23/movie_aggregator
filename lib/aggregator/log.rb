require 'logger'

class Aggregator < Thor
  class Log

    LOGLEVELS = [
      :debug,
      :info,
      :error
    ]

    # class variables
    @@instance = nil

    # accessors
    attr_reader :level
    private_class_method :new

    # create the logging level methods
    LOGLEVELS.each do |level|
      define_method(level) do |msg = nil|
        log(level, msg)
      end
    end

    # instance accessor
    def self.instance
      if @@instance.nil?
        @@instance = new
      else
        @@instance
      end
    end

    private

    # initialize the one and only instance
    def initialize
      @logger = Logger.new(Aggregator::Constants::CONFIG[:log_file])
    end

    def log(priority, msg)
      @logger.public_send(priority, msg)
    end

  end
end
