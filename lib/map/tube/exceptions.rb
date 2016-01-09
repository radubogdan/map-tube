module Map
  module Tube
    module Exceptions
      class StationException < StandardError; end
      class LineException < StandardError; end
      class RouteException < StandardError; end
      class CityException < StandardError; end
    end
  end
end
