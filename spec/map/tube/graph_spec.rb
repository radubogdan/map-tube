require 'spec_helper'

describe Map::Tube::Graph do
  let(:station) { Map::Tube::Station.new("1", "Test station", "2") }
  let(:line) { Map::Tube::Line.new("1", "Line 1", "black") }

  describe "#add_station" do
    it "should add a new station in the graph" do
      subject.add_station(station)
      expect(subject.stations.count).to eq 1
    end
  end
  describe "#add_line" do
    it "should add a new line in the graph" do
      subject.add_line(line)
      expect(subject.lines.count).to eq 1
    end
  end
  describe "#get_station_by_id" do
    it "should return a station with that id if station exists" do
      subject.add_station(station)
      expect(subject.get_station_by_id("1").id).to eq "1"
    end
    it "should return an exception if station does not exist" do
      subject.add_station(station)
      expect { subject.get_station_by_id("2") }.to raise_error(Map::Tube::Exceptions::StationError)
    end
  end
  describe "#get_station_by_name" do
    it "should return a station with that id if station exists" do
      subject.add_station(station)
      expect(subject.get_station_by_name("Test station").name).to eq "Test station"
    end
    it "should return an exception if station does not exist" do
      subject.add_station(station)
      expect { subject.get_station_by_name("Another Station") }.to raise_error(Map::Tube::Exceptions::StationError)
    end
  end
end
