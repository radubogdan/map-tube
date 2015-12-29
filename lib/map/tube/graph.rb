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

      def get_station_by_id(station_id)
        find_by(:station, :id, station_id)
      end

      def get_station_by_name(station_name)
        find_by(:station, :name, station_name)
      end

      def get_line_by_id(line_id)
        find_by(:line, :id, line_id)
      end

      def get_line_by_name(line_name)
        find_by(:line, :name, line_name)
      end

      private

      def find_by(model, attribute, value)
        get_instance_for_model(model).each do |obj|
          if obj.send(attribute) == value
            return obj
          else
            raise_error_for_model(model, attribute, value)
          end
        end
      end

      def get_instance_for_model(model)
        {
          :station => @stations,
          :line => @lines
        }[model]
      end

      def raise_error_for_model(model, attribute, value)
        case model
        when :station
          raise(Map::Tube::Exceptions::StationException, "Station with #{attribute}='#{value}' does not exist")
        when :line
          raise(Map::Tube::Exceptions::LineException, "Line with #{attribute}='#{value}' does not exist")
        end
      end
    end
  end
end
