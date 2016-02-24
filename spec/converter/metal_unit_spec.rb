require 'spec_helper'

describe Converter::MetalUnit do

  before do |test|
    Converter::SpaceUnit.set_space_unit_value(space_unit: 'glob', roman_numeral: 'I')
    Converter::SpaceUnit.set_space_unit_value(space_unit: 'prok', roman_numeral: 'V')
    Converter::SpaceUnit.set_space_unit_value(space_unit: 'pish', roman_numeral: 'X')
  end

  describe "#set_metal_value" do

    subject (:set_metal_value) { Converter::MetalUnit.set_metal_value(space_units_array: ['glob', 'prok'], metal: 'Gold', credits: 57800) }

    context "given three parameters :space_units_array, :metal and :credits " do
      it do
        set_metal_value
        metal_value = 57800 / Converter::SpaceUnit.convert_to_numeral(space_units_array: ['glob', 'prok']).to_f
        expect(Converter::MetalUnit.metals_values).to have_key('Gold').and have_value(metal_value)
      end
    end

    context "when it does not provide the named parameters expected" do
      it { expect { Converter::MetalUnit.set_metal_value('foo') }.to raise_error(ArgumentError) }
    end

  end

  describe "#convert_to_numeral" do

    let(:set_metal_value) { Converter::MetalUnit.set_metal_value(space_units_array: ['pish', 'pish'], metal: 'Iron', credits: 3910) }

    context "given two parameters :space_units_array and :metal'" do
      it do
        set_metal_value
        expect(Converter::MetalUnit.convert_to_numeral(space_units_array: ['glob', 'prok'], metal: 'Iron')).to be 782
      end
    end

    context "when it does not provide the named parameters expected" do
      it { expect { Converter::MetalUnit.convert_to_numeral('foo') }.to raise_error(ArgumentError) }
    end

  end


end
