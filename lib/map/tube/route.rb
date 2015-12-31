module Map
  module Tube
    class Route
      attr_accessor :departure_station, :arrival_station, :intermediate_stations

      def initialize(departure_station, arrival_station)
        @departure_station = departure_station
        @arrival_station = arrival_station
        @intermediate_stations = []
      end
    end
  end
end
