require 'spec_helper'

describe Converter::SpaceUnit do

  describe "#set_space_unit_value" do

    subject (:set_space_unit) { Converter::SpaceUnit.set_space_unit_value(space_unit: 'glob', roman_numeral: 'I') }

    context "given two parameters :space_unit and :roman_numeral" do
      it do
        set_space_unit
        expect(Converter::SpaceUnit.space_units_values).to have_key('glob').and have_value('I')
      end
    end

    context "when it does not provide the named parameters expected" do
      it { expect { Converter::SpaceUnit.set_space_unit_value('foo') }.to raise_error(ArgumentError) }
    end

  end

  describe "#convert_to_numeral" do

    let(:set_space_units) do
      Converter::SpaceUnit.set_space_unit_value(space_unit: 'glob', roman_numeral: 'I')
      Converter::SpaceUnit.set_space_unit_value(space_unit: 'prok', roman_numeral: 'V')
    end

    context "given a :space_units_array " do
      it 'should convert to 4'do
        set_space_units
        expect(Converter::SpaceUnit.convert_to_numeral(space_units_array: ['glob', 'prok'])).to be 4
      end
    end

    context "when it does not provide the named parameters expected" do
      it { expect { Converter::SpaceUnit.convert_to_numeral('foo') }.to raise_error(ArgumentError) }
    end

  end

end
