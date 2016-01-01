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

      def get_shortest_route(from_station_name, to_station_name)
        from_station = get_station_by_name(from_station_name)
        to_station = get_station_by_name(to_station_name)
        compute_shortest_path(from_station, to_station)
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
          return obj if obj.send(attribute) == value
        end

        raise_error_for_model(model, attribute, value)
      end

      def compute_shortest_path(from_station, to_station)
        raise_error_for_model(:route) if from_station.id == to_station.id

        route = Route.new(from_station, to_station)
        visited, queue = [], []
        edge = {}

        queue << from_station
        visited << from_station

        while queue.any?
          curr_station = queue.shift
          break if curr_station.id == to_station.id

          curr_station.links.each do |link|
            next_station = get_station_by_id(link)
            next if visited.include?(next_station)
            queue << next_station
            visited << next_station
            edge[link] = curr_station
          end
        end

        loop do
          to_station = edge[to_station.id]
          break if to_station.id == from_station.id
          route.intermediate_stations.unshift(to_station)
        end

        route
      end

      def get_instance_for_model(model)
        {
          :station => @stations,
          :line => @lines
        }[model]
      end

      def raise_error_for_model(model, attribute=nil, value=nil)
        case model
        when :station
          raise(Map::Tube::Exceptions::StationException, "Station with #{attribute}='#{value}' does not exist")
        when :line
          raise(Map::Tube::Exceptions::LineException, "Line with #{attribute}='#{value}' does not exist")
        when :route
          raise(Map::Tube::Exceptions::RouteException, "Stations must be different")
        end
      end
    end
  end
end
