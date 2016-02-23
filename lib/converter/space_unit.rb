module Converter
  class SpaceUnit

    @@space_units_values = {} # e.g: {"glob"=>"I", "prok"=>"V", "pish"=>"X", "tegj"=>"L"}

    def self.set_space_unit_value(key, value)
      @@space_units_values[key] = value
    end

    def self.convert_to_numeral(space_units_array)
      # First converts space units array to a roman string
      roman_string = ""
      space_units_array.each do |space_unit|
        roman_string << @@space_units_values[space_unit]
      end
      # Then converts the roman string to numeral
      RomanUnit.convert_to_numeral(roman_string)
    end

  end
end
