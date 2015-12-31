module Map
  module Tube
    module Exceptions
      class StationException < StandardError; end
      class LineException < StandardError; end
      class RouteException < StandardError; end
    end
  end
end
