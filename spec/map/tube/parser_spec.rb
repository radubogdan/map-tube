require 'spec_helper'
require 'nokogiri'

describe Map::Tube::Parser do
  let(:xml_doc) {
    Nokogiri::XML("<station id='M1-01' name='Dristor 2' line='M1:1' link='M1-02'/>")
  }

  describe "#initialize" do
    it "should get a Nokogiri object and correctly initialize" do
      parser = Map::Tube::Parser.new(xml_doc)
      expect(parser.class).to eq Map::Tube::Parser
    end
  end

  describe "#parse" do
    it "should return successfully without error" do
      parser = Map::Tube::Parser.new(xml_doc)
      parser.parse!
    end
  end
end
