Dir[File.join(__dir__, 'converter', '**/*.rb')].each {|file| require file }

module Converter

  module_function

  def read_input_file(file_name)
    File.read(file_name).each_line { |line| process_line line }
  end

  def process_line(line)
    case line
    when /^([a-z]+) is ([I|V|X|L|C|D|M])$/
      # Define the space_unit_value by roman numerals
      SpaceUnit.set_space_unit_value($1, $2)
    when /^([a-z ]+)([A-Z]\w+) is (\d+) Credits$/
      # Define the metal_value by space_units
      MetalUnit.set_metal_value($1.split, $2, $3)
    when /^how much is ((\w+ )+)\?$/
      # Get space_units and convert to numeral
      res = SpaceUnit.convert_to_numeral($1.split)
      puts "#{$1}is #{res} Credits"
    when /^how many Credits is ([a-z ]+)([A-Z]\w+) \?$/
      res = (SpaceUnit.convert_to_numeral($1.split) * MetalUnit.metals_values[$2]).to_i
      puts "#{$1}#{$2} is #{res} Credits"
    else
      puts "I have no idea what you are talking about"
    end
  end

end
