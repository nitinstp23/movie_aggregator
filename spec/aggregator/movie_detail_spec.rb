require 'spec_helper'
require 'thor'
require 'aggregator/movie_detail'

RSpec.describe Aggregator::MovieDetail do

  describe '#initialize' do
    it 'sets instance variables' do
      movie_name = 'Life Of PIE'
      run_time   = '2 hour 30 minutes'
      lang       = 'English'
      actor      = 'Irfan Khan'
      genre      = 'Drama'

      movie_detail = described_class.new(
                       name:  movie_name,
                       time:  run_time,
                       lang:  lang,
                       actor: actor,
                       genre: genre)

      expect(movie_detail.instance_variable_get(:@name)).to eq(movie_name)
      expect(movie_detail.instance_variable_get(:@time)).to eq(run_time)
      expect(movie_detail.instance_variable_get(:@lang)).to eq(lang)
      expect(movie_detail.instance_variable_get(:@actor)).to eq(actor)
      expect(movie_detail.instance_variable_get(:@genre)).to eq(genre)
    end
  end

  describe '#to_s' do
    it 'generates movie details' do
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

      movie_detail = described_class.new(
                       name:  movie_name,
                       time:  run_time,
                       lang:  lang,
                       actor: actor,
                       genre: genre)

      expect(movie_detail.to_s).to eq(expected_details)
    end
  end

end
