require 'spec_helper'

describe Converter::RomanUnit do

  describe "#convert_to_numeral" do

    context "given an String MCMIII" do
      subject(:roman_numerals) { 'MCMIII' }
      it "then must convert to 1903" do
        expect(Converter::RomanUnit.convert_to_numeral(roman_numerals)).to be 1903
      end
    end

  end

end
