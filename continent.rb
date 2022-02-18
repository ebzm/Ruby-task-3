class Continent

  def initialize(name)
		@name = name
		@countries = []
  end

  def add_country(country)
		@countries << country
  end

  def show_countries
		p "#{@name} contains the following countries: "
	  @countries.map { |c| print c, "; " }
	  print "\n"
  end

end