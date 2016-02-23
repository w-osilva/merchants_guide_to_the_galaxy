module Converter
  class MetalUnit

    @@metals_values = {} # e.g: {"Silver"=>17.0, "Gold"=>14450.0, "Iron"=>195.5}

    def self.metals_values
      @@metals_values
    end

    # Calculates the metal's value
    def self.set_metal_value(space_units_array, metal, credits)
      numeral = SpaceUnit.convert_to_numeral(space_units_array)
      @@metals_values[metal] = credits.to_i / numeral.to_f
    end

  end
end