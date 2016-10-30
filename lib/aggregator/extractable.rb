# this gets mixed into anything that is extractable to let the aggregator pick
# out the extractable formats
class Aggregator < Thor
  module Extractable; end
end
