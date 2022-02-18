require "rexml/document"
include REXML
require_relative "continent.rb"
require_relative "country.rb"

class World

    @@continent_index = {
  	"Europe" => 0,
  	"Asia" => 1,
  	"North America" => 2,
  	"Australia/Oceania" => 3,
  	"South America" => 4,
  	"Africa" => 5
  }

  def initialize(file)
  	@continents = []
    @countries = []
    @country_info = []
		doc = Document.new File.new(file)
		doc.elements.each("*/continent") do |element|
		  @continents << Continent.new("#{element.attributes["name"]}")
		end
		doc.elements.each("*/country") do |element| 
			@continents[@@continent_index[element.attributes['continent']]].add_country(element.attributes['name'])

      element.attributes.each { |v| @country_info << v }
      @country_info = @country_info.map{|s| s}.flatten  
      @info = Hash[*@country_info] 
      @countries << Country.new(@info)
      @country_info.clear
		end
  end

  def show_continents
    hash = Hash[*@@continent_index.sort.flatten]
    hash.each do |k, v|
      @continents[v].show_countries
    end
  end

  def population
    @populations = {}
    @countries.each { |c| @populations[c.name] = c.population.to_i }
    print "Country with the largest population: ", @populations.sort{|a,b| b[1]<=>a[1]}.first, "\n"
  end

  def inflation
    @inflations = {}
    @countries.each { |c| @inflations[c.name] = c.inflation.to_i }
    print "Top 5 countries with the highest inflation: ", @inflations.sort{|a,b| b[1]<=>a[1]}.first(5), "\n"
  end

end