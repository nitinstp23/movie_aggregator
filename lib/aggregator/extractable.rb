# this gets mixed into anything that is extractable to let the supervisor pick
# out the extractable formats
class Aggregator < Thor
  module Extractable; end
end
