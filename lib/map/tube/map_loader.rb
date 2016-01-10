module Map
  module Tube
    class MapLoader
      attr_accessor :city, :map_path

      def initialize(city_name, map_path=nil)
        @city = city_name.split(' ').join("_")
        if map_path # Always trust the path if it comes from the user
          @map_path = map_path
        else
          @map_path = set_path_for_city
        end
      end

      def read
        if File.exist?(@map_path)
          Parser.new(File.open(@map_path)).parse!
        else
          raise Map::Tube::Exceptions::CityException, "Map for #{@city} does not exist"
        end
      end

      private

      def set_path_for_city
        "data/#{filename(@city)}"
      end

      def filename(city_name)
        "#{city_name.downcase}-map.xml"
      end
    end
  end
end
