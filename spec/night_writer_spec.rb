require 'rspec'
require './lib/night_writer'

describe NightWriter do
  before :each do
    @file1 = 'message.txt'
    @file2 = 'braille.txt'
    @writer = NightWriter.new(@file1, @file2)
  end

  context 'initialization' do
    it 'exists' do
      expect(@writer).to be_a(NightWriter)
    end
  end
end
