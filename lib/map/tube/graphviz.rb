module Map
  module Tube
    class Graphviz
      attr_accessor :graph, :g

      def initialize(graph)
        @graph = graph
        @g = GraphViz.new(:G, type: :digraph, concentrate: true)
      end

      def generate
        @g.add(@graph.to_h)
        @g
      end

    end
  end
end
