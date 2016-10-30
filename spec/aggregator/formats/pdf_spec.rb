require 'spec_helper'
require 'thor'
require 'yaml'

require 'aggregator/extensions'
require 'aggregator/errors'
require 'aggregator/log'
require 'aggregator/constants'
require 'aggregator/movie_detail'
require 'aggregator/extractable'
require 'aggregator/formats/base'
require 'aggregator/formats/pdf'

RSpec.describe Aggregator::Formats::Pdf do

  let(:expected_file_path) { "#{Aggregator::Constants::SETTINGS['exported_file_path']}/pdf.pdf" }

  describe 'private methods' do
    describe '#file_path' do
      it 'returns file path' do
        pdf_format = described_class.new([])

        expect(pdf_format.send(:file_path)).to eq(expected_file_path)
      end
    end

    describe '#append' do
      context 'without errors' do
        it 'extracts movie details' do
          data_string = 'Writing this content to file'

          pdf_format = described_class.new([])

          expect(pdf_format).to receive(:file_path).once.and_return(expected_file_path)
          expect(Prawn::Document).to receive(:generate).with(expected_file_path).once.and_return(true)

          expect(pdf_format.send(:append, data_string)).to be_truthy
        end
      end

      context 'with errors' do
        it 'raises ExtractError' do
          data_string = 'Writing this content to file'

          pdf_format = described_class.new([])

          expect(pdf_format).to receive(:file_path).once.and_return(expected_file_path)
          expect(Prawn::Document).to receive(:generate).with(expected_file_path).once.and_raise(StandardError)

          expect { pdf_format.send(:append, data_string) }.to raise_error(::Aggregator::Errors::ExtractError)
        end
      end
    end
  end

end
