require_relative "Unit"

include Units

#handles when the user asks for a conversion
def converter()
	puts "Your conversion should follow the format \"A from_unit = B to_unit\""
	puts "What is the abbreviation of the unit are you converting from? (\"from_unit\")"
	from_unit_abbr = gets.chomp

	until Units.abbreviations.has_key?(from_unit_abbr)
		puts "That is not a valid abbreviation"
		puts "Please enter a valid abbreviation"
		from_unit_abbr = gets.chomp
	end

	puts "How many #{from_unit_abbr}. are you converting? (What is A?)"
	from_amount = Float(gets.chomp)

	puts "What is the abbreviation of the unit you are converting to? (\"to_unit\")"
	to_unit_abbr = gets.chomp

	until Units.abbreviations.has_key?(to_unit_abbr)
		puts "That is not a valid abbreviation"
		puts "Please enter a valid abbreviation"
		to_unit_abbr = gets.chomp
	end

	#Now we make sure they're the same dimension
	from_unit = Units.abbreviations[from_unit_abbr]
	to_unit = Units.abbreviations[to_unit_abbr]
	if from_unit.dimension != to_unit.dimension
		puts "You can only convert units of the same dimension."
	else
		#now we get to finally make a conversion
		to_amount = from_amount * from_unit.toBase * to_unit.fromBase
		puts "#{from_amount} #{from_unit_abbr}. = #{to_amount} #{to_unit_abbr}."
	end
end

#handles when the user asks for all abbreviations
def abbreviationList()
	puts "Here is a list of each unit and their abbreviation:"
	puts " Unit:            Abbreviation:   Dimension:"
	for abbr, unit in Units.abbreviations
		print " "
		print "#{unit.dimension}"
		print " " * (10 - unit.dimension.length)
		print " | "
		print "#{unit.name}"
		print " " * (14 - unit.name.length)
		print " | "
		print "#{abbr}"
		print " " * (13 - abbr.length)
		print "\n"
	end
end

puts "-"*10
puts "Welcome to Unit Converter!"

choice = 1
until choice > 2 || choice < 1
	puts "-"*10
	puts "Press:"
	puts "\t1 to convert between units"
	puts "\t2 to view a list of all units and their abbreviations"
	puts "\tAnything else to quit"

	#process the User input
	begin 
		choice = Integer(gets.chomp)
	rescue ArgumentError, TypeError
		choice = -1
	end

	#separator between User input and the next menu
	puts "-"*10
	#handle choice
	if choice == 1
		converter()
	elsif choice == 2
		abbreviationList()
	else
		#Note here that choice is 3 (or higher), so the loop will quit anyway
	end
end
