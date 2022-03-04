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


    it '#info_msg can print an info message' do
      expected = "Created 'braille_test.txt' containing 15 characters"
      expect(@e_reader.info_msg).to eq(expected)
      expect(@e_reader.character_count).to eq(15)
    end
  end

  context 'reading/writing files' do
    it 'EnglishReader #lines shows the lines in message.txt' do
      expected_lines = File.readlines(@file1)
      expect(@e_reader.lines).to eq(expected_lines[0])
    end

    it '#translate can read from a file and write to another' do
      @e_reader.translate(@file1, @file2)
      new_file = File.readlines(@file2)
      expect(new_file[0]).to eq("aaaaaaaaaaaaaaa")
    end
  end


end
