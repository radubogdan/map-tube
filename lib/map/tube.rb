require "map/tube/version"
require "nokogiri"
require "map/tube/node"
require "map/tube/graph"
require "map/tube/parser"

module Map
  module Tube
    def self.new(xml_file_path)
      doc = File.open(xml_file_path) { |f| Nokogiri::XML(f) }
      Parser.new(doc).parse!
    end
  end
end
