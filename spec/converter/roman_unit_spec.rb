require 'spec_helper'

describe Converter::RomanUnit do

  describe "#convert_to_numeral" do

    subject(:roman_string) { 'MCMXCIX' }

    context "given a :roman_string 'MCMXCIX'" do
      it 'should convert to 1999' do
        expect(Converter::RomanUnit.convert_to_numeral(roman_string: roman_string)).to be 1999
      end
    end

    context "when it does not provide the named parameters expected" do
      it { expect { Converter::RomanUnit.convert_to_numeral('foo') }.to raise_error(ArgumentError) }
    end

  end

end
