require 'spec_helper'

describe Map::Tube::Graph do
  let(:subject) {
    Map::Tube::Parser.
      new(File.
        open("spec/fixtures/bucharest-map.xml") { |f|
          Nokogiri::XML(f)
        }
      ).parse!
  }

  describe "#add_station" do
    it "should add a new station in the graph" do
      subject.add_station(Map::Tube::Station.new("1", "Test station", "2"))
      expect(subject.stations.map(&:name)).to include station.name
    end
  end

  describe "#add_line" do
    it "should add a new line in the graph" do
      subject.add_line(Map::Tube::Line.new("1", "Line 1", "black"))
      expect(subject.lines.map(&:name)).to include line.name
    end
  end

  describe "#get_station_by_id" do
    it "should return a station with that id if station exists" do
      expect(subject.get_station_by_id("M1-01").id).to eq "M1-01"
    end
    it "should return an exception if station with that id does not exist" do
      expect { subject.get_station_by_id("2") }.to raise_error(Map::Tube::Exceptions::StationException)
    end
  end

  describe "#get_station_by_name" do
    it "should return a station with that id if station exists" do
      expect(subject.get_station_by_name("Dristor 2").name).to eq "Dristor 2"
    end
    it "should return an exception if station with that name does not exist" do
      expect { subject.get_station_by_name("Another Station") }.to raise_error(Map::Tube::Exceptions::StationException)
    end
  end

  describe "#get_line_by_id" do
    it "should return a line with that id if line exists" do
      expect(subject.get_line_by_id("M1").id).to eq "M1"
    end

    it "should return an exception if line with that id does not exist" do
      expect { subject.get_line_by_id("2") }.to raise_error(Map::Tube::Exceptions::LineException)
    end
  end

  describe "#get_line_by_name" do
    it "should return a line with that name if line exists" do
      expect(subject.get_line_by_name("Linia M1").name).to eq "Linia M1"
    end

    it "should return an exception if line with that name does not exist" do
      expect { subject.get_line_by_name("Line 2") }.to raise_error(Map::Tube::Exceptions::LineException)
    end
  end

end
