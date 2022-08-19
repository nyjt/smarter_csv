require 'spec_helper'

fixture_path = 'spec/fixtures'

describe 'be_able_to' do
  it 'add _1 do header fields' do
    options = {:header_converter => lambda {|x| "#{x}_1"} }
    data = SmarterCSV.process("#{fixture_path}/basic.csv", options)
    expect(data.size).to eq(5)

    # all the keys should be symbols
    data.each { |item| item.keys.each{ |x| expect(x.class).to eq(Symbol) } }

    data.each do |hash|
      hash.keys.each do |key|
        expect([:first_name_1, :last_name_1, :dogs_1, :cats_1, :birds_1, :fish_1]).to include(key)
      end
    end
  end
end
