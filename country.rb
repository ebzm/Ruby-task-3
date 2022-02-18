class Country

	def initialize(hash)
		@info = hash
		@name = @info['name']
		@population = @info['population']
		@inflation = @info['inflation']
	end

	def name
		return @name
	end

	def population
		return @population
	end

	def inflation
		return @inflation
	end
  
end