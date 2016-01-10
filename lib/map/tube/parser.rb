module Map
  module Tube
    class Parser
      def initialize(doc)
        @document = Nokogiri::XML(doc)
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
            parse_line(station["line"]))

          links = station["link"].split(",")
          links += compute_other_links(station["other_link"]) if station["other_link"]
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

      def parse_line(line)
        if line.include?(":")
          line[/(.*):/, 1]
        else
          line
        end
      end

      def compute_other_links(links)
        links.split(",").map! { |e| e.split(":")[1] }
      end
    end
  end
end
