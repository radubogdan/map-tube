require 'spec_helper'
require 'nokogiri'

describe Map::Tube::Parser do
  let(:subject) {
    Map::Tube::Parser.
      new(File.
        open("data/bucharest-map.xml")
      )
  }

  describe "#initialize" do
    it "should get a File object and correctly initialize" do
      expect(subject.class).to eq Map::Tube::Parser
    end
  end

  describe "#parse!" do
    it "should return successfully without error" do
      subject.parse!
    end

    it "should return a graph with 57 stations" do
      graph = subject.parse!
      expect(graph.stations.count).to eq(57)
    end

    it "should return a graph with 4 lines" do
      graph = subject.parse!
      expect(graph.lines.count).to eq(4)
    end
  end
end
