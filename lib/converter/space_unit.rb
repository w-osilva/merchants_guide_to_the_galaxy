module Converter
  class SpaceUnit
    include NamedParams

    cattr_reader :space_units_values

    @@space_units_values ||= {} # e.g: {"glob"=>"I", "prok"=>"V", "pish"=>"X", "tegj"=>"L"}

    def self.set_space_unit_value(space_unit: required, roman_numeral: required)
      @@space_units_values[space_unit] = roman_numeral
    end

    def self.convert_to_numeral(space_units_array: required)
      # First converts space units array to a roman string
      roman_string = ""
      space_units_array.each do |space_unit|
        roman_string << @@space_units_values[space_unit]
      end
      # Then converts the roman string to numeral
      RomanUnit.convert_to_numeral(roman_string: roman_string)
    end

  end
end
