require 'spec_helper'

describe Map::Tube::MapLoader do
  let(:valid_map) { Map::Tube::MapLoader.new("Bucharest", "data/map-tube/bucharest-map.xml") }
  let(:invalid_map) { Map::Tube::MapLoader.new("MyCity", "data/map-tube/mycity-map.xml") }

  describe ".initialize" do
    it "should get a city name and automatically setup the path" do
      expect(valid_map.map_path).to eq "data/map-tube/bucharest-map.xml"
    end

    it "can get a city name and a path" do
      expect(invalid_map.city).to eq "MyCity"
    end
  end

  describe "#read" do
    context "when path is valid" do
      it "should return a Map::Tube::Graph object" do
        expect(valid_map.read.class).to eq Map::Tube::Graph
      end
    end

    context "when path is invalid" do
      it "should raise an exception" do
        expect{ invalid_map.read }.to raise_error(Map::Tube::Exceptions::CityException)
      end
    end
  end
end
