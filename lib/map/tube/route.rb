module Map
  module Tube
    class Route
      attr_accessor :departure_station, :arrival_station, :intermediate_stations

      def initialize(departure_station, arrival_station)
        @departure_station = departure_station
        @arrival_station = arrival_station
        @intermediate_stations = []
      end

      def pretty
        [self.departure_station.name,
          self.intermediate_stations.map(&:name),
          self.arrival_station.name].flatten.join(" -> ")
      end
    end
  end
end
