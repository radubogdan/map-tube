module Map
  module Tube
    class Line
      attr_accessor :id, :name, :color

      def initialize(id, name, color)
        @id = id
        @name = name
        @color = color
      end
    end
  end
end
