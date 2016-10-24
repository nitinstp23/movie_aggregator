require 'thor'

require 'aggregator/constants'
require 'aggregator/log'
require 'aggregator/errors'

class Aggregator < Thor

  desc 'export', 'Run movie aggregator'
  method_option :debug, type: :boolean, default: false
  def export
    log = Aggregator::Log.instance
    log.info('START aggregator')

    log.info('STOP aggregator')
  rescue => ex
    log.error(ex)

    if options[:debug]
      log.debug(ex.backtrace.join("\n"))
    end
  end

end
