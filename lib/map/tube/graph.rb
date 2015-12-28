module Map
  module Tube
    class Graph
      attr_accessor :nodes

      def initialize
        @nodes = []
      end

      def add_node(node)
        @nodes << node
      end
    end
  end
end
