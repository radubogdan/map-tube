module Map
  module Tube
    class Parser
      def initialize(doc)
        @document = doc
        @graph = Graph.new
      end

      def parse!
        parse_lines!
        parse_stations!
        @graph
      end

      private

      def parse_stations!
        stations = @document.search("//stations/station")
        stations.each do |station|
          current_station = Station.new(
            station["id"],
            station["name"],
            station["line"][/(.*):/, 1])

          links = station["link"].split(",")
          links += station["other_link"].split(",") if station["other_link"]
          links.each { |link| current_station.add_link(link) }

          @graph.add_station(current_station)
        end
      end

      def parse_lines!
        lines = @document.search("//lines/line")
        lines.each do |line|
          element = Line.new(line["id"], line["name"], line["color"])
          @graph.add_line(element)
        end
      end

      def get_station_links(station)
      end
    end
  end
end
