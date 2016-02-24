module Converter
  class MetalUnit
    include NamedParams

    cattr_reader :metals_values

    @@metals_values ||= {} # e.g: {"Silver"=>17.0, "Gold"=>14450.0, "Iron"=>195.5}

    # Calculates the metal's value
    def self.set_metal_value(space_units_array: required, metal: required, credits: required)
      numeral = SpaceUnit.convert_to_numeral(space_units_array: space_units_array)
      @@metals_values[metal] = credits.to_i / numeral.to_f
    end

    def self.convert_to_numeral(space_units_array: required , metal: required)
      (SpaceUnit.convert_to_numeral(space_units_array: space_units_array) * @@metals_values[metal]).to_i
    end

  end
end