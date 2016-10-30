require 'spec_helper'
require 'thor'
require 'yaml'

require 'aggregator/extensions'
require 'aggregator/errors'
require 'aggregator/log'
require 'aggregator/constants'
require 'aggregator/movie_detail'
require 'aggregator/formats/base'

RSpec.describe Aggregator::Formats::Base do

  describe '#extract' do
    context 'without errors' do
      it 'extracts movie details' do
        movie_name = 'Life Of PIE'
        run_time   = '2 hour 30 minutes'
        lang       = 'English'
        actor      = 'Irfan Khan'
        genre      = 'Drama'

        expected_details = <<-DETAILS
          Movie Details:
          Name       - #{movie_name}
          Run Time   - #{run_time}
          Language   - #{lang}
          Lead Actor - #{actor}
          Genre      - #{genre}
        DETAILS

        expect_any_instance_of(::Aggregator::MovieDetail).to receive(:to_s).and_return(expected_details)

        base_obj = described_class.new([
                     movie_name,
                     run_time,
                     lang,
                     actor,
                     genre])

        expect(base_obj).to receive(:append).once.with(expected_details).and_return(true)

        base_obj.extract
      end
    end

    context 'with errors' do
      context 'NotImplementedError' do
        it 'handles extract errors' do
          movie_name = 'Life Of PIE'
          run_time   = '2 hour 30 minutes'
          lang       = 'English'
          actor      = 'Irfan Khan'
          genre      = 'Drama'

          expected_details = <<-DETAILS
            Movie Details:
            Name       - #{movie_name}
            Run Time   - #{run_time}
            Language   - #{lang}
            Lead Actor - #{actor}
            Genre      - #{genre}
          DETAILS

          expect_any_instance_of(::Aggregator::MovieDetail).to receive(:to_s).and_return(expected_details)

          base_obj = described_class.new([
                       movie_name,
                       run_time,
                       lang,
                       actor,
                       genre])

          expect(base_obj).to receive(:append).once.with(expected_details).and_raise(NotImplementedError)

          expect { base_obj.extract }.to_not raise_error
        end
      end

      context 'ExtractError' do
        it 'handles extract errors' do
          movie_name = 'Life Of PIE'
          run_time   = '2 hour 30 minutes'
          lang       = 'English'
          actor      = 'Irfan Khan'
          genre      = 'Drama'

          expected_details = <<-DETAILS
            Movie Details:
            Name       - #{movie_name}
            Run Time   - #{run_time}
            Language   - #{lang}
            Lead Actor - #{actor}
            Genre      - #{genre}
          DETAILS

          expect_any_instance_of(::Aggregator::MovieDetail).to receive(:to_s).and_return(expected_details)

          base_obj = described_class.new([
                       movie_name,
                       run_time,
                       lang,
                       actor,
                       genre])

          expect(base_obj).to receive(:append).once.with(expected_details).and_raise(::Aggregator::Errors::ExtractError)

          expect { base_obj.extract }.to_not raise_error
        end
      end
    end
  end

end
