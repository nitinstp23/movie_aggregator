require 'spec_helper'
require 'thor'
require 'aggregator/constants'
require 'aggregator/log'

RSpec.describe Aggregator::Log do

  describe '.instance' do
    it 'creates a single instance of self' do
      log1 = described_class.instance
      log2 = described_class.instance

      expect(log1.object_id).to eq(log2.object_id)
    end
  end

  describe 'private methods' do
    describe '#initialize' do
      it 'instantiates a Logger object' do
        log = described_class.send(:new)

        expect(log.instance_variable_get(:@logger)).to be_an_instance_of(Logger)
      end
    end

    describe '#log' do
      it 'sends message and priority to the logger' do
        log = described_class.send(:new)
        logger = log.instance_variable_get(:@logger)

        priority = :info
        message  = 'Something amazing happening'

        expect(logger).to receive(priority).with(message)

        log.send(:log, priority, message)
      end
    end
  end

end
