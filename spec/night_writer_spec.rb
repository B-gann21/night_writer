require 'rspec'
require './lib/english_reader'

describe EnglishReader do
  before :each do
    @file1 = 'message.txt'
    @file2 = 'braille.txt'
    @e_reader = EnglishReader.new(@file1, @file2)
  end

  context 'initialization' do
    it 'exists' do
      expect(@e_reader).to be_a(EnglishReader)
    end

    it 'prints a welcome message' do

    end
  end
end
