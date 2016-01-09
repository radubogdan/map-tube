require 'spec_helper'

describe Map::Tube do
  describe ".new" do
    it "takes a city name and returns a valid Map::Tube::Loader object" do
      expect(subject.new("Bucharest").class).to eq Map::Tube::MapLoader
    end
  end

  describe ".new_from_xml" do
    it "takes a city name and a path to the xml file and returns a valid Map::Tube::MapLoader object" do
      expect(subject.new_from_xml("Bucharest", "data/bucharest-map.xml").class).to eq Map::Tube::MapLoader
    end
  end
end
