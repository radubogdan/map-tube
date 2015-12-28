module Map
  module Tube
    class Parser
      def initialize(doc)
        @document = doc
        @graph = Graph.new
      end

      def parse!
        parse_stations!
        @graph
      end

      private

      def parse_stations!
        stations = @document.search("//stations/station")
        stations.each do |station|
          node = Node.new(
            station["id"],
            station["name"],
            station["line"],
            station["link"])
          @graph.add_node(node)
        end
      end
    end
  end
end
