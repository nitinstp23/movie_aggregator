require 'thor'
require 'pathname'
require 'yaml'

require 'aggregator/constants'
require 'aggregator/log'
require 'aggregator/errors'
require 'aggregator/movie_detail'
require 'aggregator/extractable'

Pathname.new('lib/aggregator/formats/').each_child do |path|
  # Couldn't get it to work without this HACK :(
  require "aggregator/formats/#{path.basename}"
end

class Aggregator < Thor

  log = Aggregator::Log.instance

  Aggregator::Formats.constants.each do |constant_name|
    log.debug "Considering #{constant_name}"

    klass = Aggregator::Formats.const_get(constant_name)

    if klass.is_a?(Class) and klass.include?(Aggregator::Extractable)
      log.info "Constructing format: #{klass}"

      # This is how we demodulize a class in ruby
      # and need not include `active_support` ;)
      klass_name = klass.name.split('::').last.downcase

      desc klass_name, "Extract movie details to #{klass_name} format"
      option :debug, type: :boolean, default: false
      subcommand klass_name, klass
    end
  end

end
