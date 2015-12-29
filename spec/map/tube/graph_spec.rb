require 'spec_helper'

describe Map::Tube::Graph do
  describe "#add_station" do
    it "should add a new station in the graph" do
      subject.add_station(Map::Tube::Station.new("1", "Test station", "2"))
      expect(subject.stations.count).to eq 1
    end
  end
  describe "#add_line" do
    it "should add a new line in the graph" do
      subject.add_line(Map::Tube::Line.new("1", "Line 1", "black"))
      expect(subject.lines.count).to eq 1
    end
  end
end
