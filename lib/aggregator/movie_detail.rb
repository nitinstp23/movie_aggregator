class Aggregator < Thor
  class MovieDetail

    def initialize(attributes = {})
      @name  = attributes[:name]
      @time  = attributes[:time]
      @lang  = attributes[:lang]
      @actor = attributes[:actor]
      @genre = attributes[:genre]
    end

    def to_s
      <<-DETAILS
        Movie Details:
        Name       - #{@name}
        Run Time   - #{@time}
        Language   - #{@lang}
        Lead Actor - #{@actor}
        Genre      - #{@genre}
      DETAILS
    end

  end
end
