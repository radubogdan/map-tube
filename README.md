# Map::Tube

The core module to process the map data. It provides the interface to find the shortest route in terms of stoppage between two nodes.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'map-tube'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install map-tube

## Usage

**Example**

```
# Load the map and read it
bucharest = Map::Tube.new("Bucharest").read

# Or load your xml
mycity = Map::Tube.new_from_xml("My City", "path/to/xml").read

# Get all the line names
bucharest.lines.map(&:name) # => ["Linia M1", "Linia M2", "Linia M3", "Linia M4"]

# Get all the station names
bucharest.stations.map(&:name)

# Get the shortest path between two stations
route = bucharest.get_shortest_route("Dristor 1", "Pipera")

# => #<Map::Tube::Route:0x007f9769c5a550
 @arrival_station=#<Map::Tube::Station:0x007f976a08e310 @id="M2-01", @line="M2", @links=#<Set: {"M2-02"}>, @name="Pipera">,
 @departure_station=#<Map::Tube::Station:0x007f976a08fa30 @id="M1-17", @line="M1", @links=#<Set: {"M1-16", "M1-18", "M3-11"}>, @name="Dristor 1">,
 @intermediate_stations=
  [#<Map::Tube::Station:0x007f976a08ff58 @id="M1-16", @line="M1", @links=#<Set: {"M1-15", "M1-17", "M3-10"}>, @name="Mihai Bravu">,
   #<Map::Tube::Station:0x007f97698261f0 @id="M1-15", @line="M1", @links=#<Set: {"M1-14", "M1-16", "M3-09"}>, @name="Timpuri Noi">,
   #<Map::Tube::Station:0x007f976982c208 @id="M1-14", @line="M1", @links=#<Set: {"M1-13", "M1-15", "M3-08", "M2-07"}>, @name="Piața Unirii 1">,
   #<Map::Tube::Station:0x007f976a08cdd0 @id="M2-07", @line="M2", @links=#<Set: {"M2-06", "M2-08", "M3-08"}>, @name="Piața Unirii 2">,
   #<Map::Tube::Station:0x007f976a08d118 @id="M2-06", @line="M2", @links=#<Set: {"M2-05", "M2-07"}>, @name="Universitate">,
   #<Map::Tube::Station:0x007f976a08d460 @id="M2-05", @line="M2", @links=#<Set: {"M2-04", "M2-06"}>, @name="Piața Romană">,
   #<Map::Tube::Station:0x007f976a08d988 @id="M2-04", @line="M2", @links=#<Set: {"M2-03", "M2-05", "M1-06"}>, @name="Piața Victoriei">,
   #<Map::Tube::Station:0x007f976a08dcd0 @id="M2-03", @line="M2", @links=#<Set: {"M2-02", "M2-04"}>, @name="Aviatorilor">,
   #<Map::Tube::Station:0x007f976a08e018 @id="M2-02", @line="M2", @links=#<Set: {"M2-01", "M2-03"}>, @name="Aurel Vlaicu">]>

# Pretty print the route
route.pretty
# => "Dristor 1 -> Mihai Bravu -> Timpuri Noi -> Piața Unirii 1 -> Piața Unirii 2 -> Universitate -> Piața Romană -> Piața Victoriei -> Aviatorilor -> Aurel Vlaicu -> Pipera"
```

## Documentation

**Map::Tube**
  - `.new(city_name)` *-> Map::Tube::Loader*
  - `.new_from_xml(city_name, path_to_xml)` *-> Map::Tube::Loader*

**Map::Tube::Loader**
  - `.new(city_name, map_path=nil)`
    - *(mandatory)* city_name - String - It should match a city in data/ dir
    - *(optional)* map_path - String - Path to local xml
  - `#city`
  - `#map_path`
  - `#read` *-> Map::Tube::Graph*

**Map::Tube::Graph**
  - `#stations` *-> Array [ Map::Tube::Station ]*
  - `#lines` *-> Array [ Map::Tube::Line ]*
  - `#get_shortest_route(from_station_name, to_station_name)` *-> Map::Tube::Route*
    - from_station_name - String - Name of departure station
    - to_station_name - String - Name of arrival station
  - `#get_station_by_id(station_id)` *-> Map::Tube::Station*
    - station_id - String - Unique identifier of the station
  - `#get_station_by_name(station_name)` *-> Map::Tube::Station*
    - station_name - String - Name of the station
  - `#get_line_by_id(line_id)` *-> Map::Tube::Line*
    - line_id - String - Unique identifier of the line
  - `#get_line_by_name(line_name)` *-> Map::Tube::Line*
    - line_name - String - Name of the line
  - `#add_line(line)` *-> Map::Tube::Graph*
    - line - Map::Tube::Line object
  - `#add_station(station)` *-> Map::Tube::Graph*
    - station - Map::Tube::Station object

**Map::Tube::Line**
  - `.new(id, name, color)`
    - id - String - unique identifier of the Line
    - name - String - name of the line
    - color - String - color of the line
  - `#id`
  - `#name`
  - `#color`

**Map::Tube::Station**
  - `.new(id, name, line)`
    - id - String - unique identifier of the Station
    - name - String - name of the Station
    - line - String - line that supports the Station
  - `#id`
  - `#name`
  - `#line`
  - `#links` *-> Set { String }*
  - `#add_link(link)`
    - link - String - unique identifier of the station

**Map::Tube::Route**
  - `.new(departure_station, arrival_station)`
    - departure_station - Map::Tube::Station
    - arrival_station - Map::Tube::Station
  - `#departure_station` *-> Map::Tube::Station*
  - `#arrival_station` *-> Map::Tube::Station*
  - `#intermediate_stations` *-> Array [ Map::Tube::Station ]*
  - `#pretty` *-> String*

**Map::Tube::Parser**
  - `.new(file_handle)`
    - file_handle - File.open(path)
      - path - String - path to xml
  - `#parse` *-> Map::Tube::Graph*

**Map::Tube::Exceptions**
  - StationException
  - LineException
  - RouteException
  - CityException

## Contributing

Bug reports and pull requests are welcome on GitHub at [radubogdan/map-tube](https://github.com/radubogdan/map-tube).


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
