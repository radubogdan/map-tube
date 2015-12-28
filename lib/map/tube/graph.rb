module Map
  module Tube
    class Graph
      attr_accessor :stations, :lines

      def initialize
        @stations = []
        @lines = []
      end

      def add_station(station)
        @stations << station
      end

      def add_line(line)
        @lines << line
      end
    end
  end
end
