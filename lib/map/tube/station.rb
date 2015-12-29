require "set"

module Map
  module Tube
    class Station
      attr_accessor :id, :name, :line

      def initialize(id, name, line)
        @id = id
        @name = name
        @line = line
        @links = Set.new()
      end

      def add_link(link)
        @links << link
      end
    end
  end
end
