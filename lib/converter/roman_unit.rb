module Converter
  class RomanUnit

    # Scheme used in numeral/roman conversion
    @@roman_map = [
      ["M",1000],
      ["CM",900],
      ["D",500],
      ["CD",400],
      ["C",100],
      ["XC",90],
      ["L",50],
      ["XL",40],
      ["X",10],
      ["IX",9],
      ["V",5],
      ["IV",4],
      ["I",1]
    ]

    # Converts a roman string to numeral using the roman_map array
    def self.convert_to_numeral(roman_string)
      sum = 0
      for key, value in @@roman_map
        while roman_string.index(key) == 0
          sum += value
          roman_string.slice!(key)
        end
      end
      sum
    end

  end
end
