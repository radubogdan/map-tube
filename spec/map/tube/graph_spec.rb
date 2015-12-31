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
      station = Map::Tube::Station.new("1", "Test station", "2")
      subject.add_station(station)
      expect(subject.stations.map(&:name)).to include station.name
    end
  end

  describe "#add_line" do
    it "should add a new line in the graph" do
      line = Map::Tube::Line.new("1", "Line 1", "black")
      subject.add_line(line)
      expect(subject.lines.map(&:name)).to include line.name
    end
  end

  describe "#get_shortest_route" do
    it "should raise Exception if departure and arrival are the same" do
      expect { subject.get_shortest_route("Dristor 2", "Dristor 2") }.to raise_error(Map::Tube::Exceptions::RouteException)
    end
    it "should return a Map::Tube::Route object" do
      expect(subject.get_shortest_route("Dristor 2", "Obor").class).to eq Map::Tube::Route
    end
    it "should return no path when arrival is departure - 1 in distance" do
      route = subject.get_shortest_route("Dristor 2", "Piața Muncii")
      expect(route.intermediate_stations.count).to eq 0
    end
    it "should return correct path for a single line" do
      route = subject.get_shortest_route("Dristor 2", "Obor")
      expect(route.intermediate_stations.map(&:name)).to eq ["Piața Muncii", "Iancului"]
    end
    it "should return correct path on multi-line routes" do
      route = subject.get_shortest_route("Obor", "1 Mai")
      expect(route.intermediate_stations.map(&:name)).to eq ["Ștefan cel Mare", "Piața Victoriei", "Gara de Nord", "Basarab", "Basarab", "Grivița"]
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
