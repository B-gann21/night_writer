require 'rspec'
require './lib/english_reader'

describe EnglishReader do
  before :each do
    @file1 = 'message_test.txt'
    @file2 = 'braille_test.txt'
    @file3 = 'message_test_2.txt'
    @file4 = 'braille_test_2.txt'
    @e_reader = EnglishReader.new(@file1, @file2)
  end

  context 'initialization' do
    it 'exists' do
      expect(@e_reader).to be_a(EnglishReader)
    end


    it '#info_msg can print an info message' do
      expected = "Created 'braille_test.txt' containing 15 characters"
      expect(@e_reader.info_msg).to eq(expected)
    end
  end

  context 'reading/writing files' do
    it 'EnglishReader #lines shows the lines in message.txt' do
      expected_lines = File.readlines(@file1)
      expect(@e_reader.lines).to eq(expected_lines)
    end

    it 'EnglishReader #write can write to a given file' do
      first_expected = File.readlines(@file1)[0].delete("\n")
      @e_reader.write
      first_actual = File.readlines(@file2)

      expect(first_actual[0]).to eq(first_expected)
    end

    it '#write can write to a different file' do
      @e_reader_2 = EnglishReader.new(@file3, @file4)
      second_expected = File.readlines(@file3)[0].delete("\n")
      @e_reader_2.write
      second_actual = File.readlines(@file4)

      expect(second_actual[0]).to eq(second_expected)
    end
  end

  context 'grabbing, counting, and converting characters' do
    it '#character_count can count all characters' do
      expect(@e_reader.character_count).to eq(15)
    end

    it '#get_characters returns an array of characters' do
      expected = [
        'a', 'a', 'a', 'a', 'a',
        'a', 'a', 'a', 'a', 'a',
        'a', 'a', 'a', 'a', 'a'
      ]
      expect(@e_reader.get_characters).to eq(expected)
    end
  end

end
