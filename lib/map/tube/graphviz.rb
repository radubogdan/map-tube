module Map
  module Tube
    class Graphviz
      attr_accessor :graph, :g

      def initialize(graph, output="png")
        @graph = graph
        @output = output
        @g = GraphViz.new(:G, type: :digraph)
      end

      def generate
        add_nodes_and_edges
        @g
      end

      private

      def add_nodes_and_edges
        @graph.stations.each do |station|
          @g.add_node(station.name) unless @g.get_node(station.name)
          if @g.get_node(station.name)
            station.links.each do |link|
              next_station = @graph.get_station_by_id(link)
              unless station.name == next_station.name
                @g.add_node(next_station.name)
                @g.add_edge(station.name, next_station.name)
              end
            end
          end
        end
      end

    end
  end
end
