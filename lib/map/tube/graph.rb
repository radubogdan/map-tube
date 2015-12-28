module Map
  module Tube
    class Graph
      attr_accessor :stations

      def initialize
        @stations = []
      end

      def add_station(station)
        @stations << station
      end
    end
  end
end
