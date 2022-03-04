require 'rspec'
require './lib/english_reader'

describe EnglishReader do
  before :each do
    @file1 = 'message_test.txt'
    @file2 = 'braille_test.txt'
    @e_reader = EnglishReader.new(@file1, @file2)
  end

  context 'initialization' do
    it 'exists' do
      expect(@e_reader).to be_a(EnglishReader)
    end

    it 'can print an info message' do
      expected = "Created 'braille_test.txt' containing 15 characters"
      expect(@e_reader.info_msg).to eq(expected)
    end
  end

  context 'reading/writing files' do
    it 'can read from a file and write to another' do
      @e_reader.translate(@file1)

      expect(File.readlines(@file2)).to eq("aaaaaaaaaaaaaaa")
    end
  end


end
