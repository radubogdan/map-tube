require "nokogiri"
require "map/tube/version"
require "map/tube/exceptions"
require "map/tube/station"
require "map/tube/line"
require "map/tube/route"
require "map/tube/graph"
require "map/tube/parser"
require "map/tube/map_loader"

module Map
  module Tube
    def self.new(city_name)
      MapLoader.new(city_name)
    end

    def self.new_from_xml(city_name, xml_file_path)
      MapLoader.new(city_name, xml_file_path)
    end
  end
end
