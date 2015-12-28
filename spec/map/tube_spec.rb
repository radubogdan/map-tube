require 'spec_helper'

describe Map::Tube do
  describe "#initialize" do
    it "takes a xml file and returns a valid Map::Tube::Graph object" do
      expect(Map::Tube.new("spec/fixtures/bucharest-map.xml").class).to eq Map::Tube::Graph
    end
  end
end
