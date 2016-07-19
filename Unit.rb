module Units

	class Unit
		def initialize(name, toBase, dimension)
			@name = name
			@dimension = dimension
			@toBase = toBase
			@fromBase = 1.0/toBase
		end

		attr_reader :name
		attr_reader :dimension
		attr_reader :toBase
		attr_reader :fromBase
	end

	def ounce; Unit.new("ounce", 1.0, "weight"); end
	def pound; Unit.new("pound", 16.0, "weight"); end
	def stone; Unit.new("stone", 224.0, "weight"); end
	def gram; Unit.new("gram", 0.035274, "weight"); end
	def kilogram; Unit.new("kilogram", 35.274, "weight"); end

	def second; Unit.new("second", 1.0, "time"); end
	def minute; Unit.new("minute", 60.0, "time"); end
	def hour; Unit.new("hour", 60*60.0, "time"); end
	def day; Unit.new("day", 60*60*24.0, "time"); end

	def teaspoon; Unit.new("US teaspoon", 1.0/6.0, "volume"); end
	def tablespoon; Unit.new("US tablespoon", 0.5, "volume"); end
	def fluid_ounce; Unit.new("US fluid ounce", 1.0, "volume"); end
	def cup; Unit.new("cup", 8.0, "volume"); end
	def pint; Unit.new("pint", 8*2.0, "volume"); end
	def quart; Unit.new("quart", 8*2*2.0, "volume"); end
	def gallon; Unit.new("gallon", 8*2*2*4.0, "volume"); end
	def liter; Unit.new("liter", 33.814, "volume"); end

	def inch; Unit.new("inch", 1.0, "distance"); end
	def foot; Unit.new("foot", 12.0, "distance"); end
	def yard; Unit.new("yard", 36.0, "distance"); end
	def mile; Unit.new("mile", 12*5280.0, "distance"); end
	def centimeter; Unit.new("centimeter", 0.393701, "distance"); end
	def meter; Unit.new("meter", 39.3701, "distance"); end
	def kilometer; Unit.new("kilometer", 39370.1, "distance"); end

	def abbreviations
		{
			"km" => Units.kilometer,
			"m" => Units.meter,
			"cm" => Units.centimeter,
			"mi" => Units.mile,
			"yd" => Units.yard,
			"ft" => Units.foot,
			"in" => Units.inch,

			"pt" => Units.pint,
			"cu" => Units.cup,
			"fl. oz" => Units.fluid_ounce,
			"lit" => Units.liter,
			"qt" => Units.quart,
			"gal" => Units.gallon,
			"tsp" => Units.teaspoon,
			"tbsp" => Units.tablespoon,

			"sec" => Units.second,
			"min" => Units.minute,
			"hr" => Units.hour,
			"day" => Units.day,	

			"oz" => Units.ounce,
			"lb" => Units.pound,
			"st" => Units.stone,
			"g" => Units.gram,
			"kg" => Units.kilogram
		}
	end
end