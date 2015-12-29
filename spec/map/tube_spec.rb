require 'spec_helper'

describe Map::Tube do
  describe "initialize" do
    describe "#new_from_xml" do
      it "takes a xml file and returns a valid Map::Tube::Graph object" do
        expect(Map::Tube.new_from_xml("spec/fixtures/bucharest-map.xml").class).to eq Map::Tube::Graph
      end
    end
  end
end
