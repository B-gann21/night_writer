require 'rspec'
require './lib/english_reader'

describe EnglishReader do
  before :each do
    @string1 = 'aaaaaaaaaaaaaaa'
    @string2 = 'bbbbbbbbbbbbbbb'
    @file1 = './spec/message_test.txt'
    @file2 = './spec/braille_test.txt'
    @file3 = './spec/message_test_2.txt'
    @file4 = './spec/braille_test_2.txt'
    @file5 = './spec/message_test_3'
    @file6 = './spec/braille_test_3.txt'

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

  context 'reading files' do
    it 'EnglishReader #lines shows the lines in message.txt' do
      expected_lines = File.readlines(@file1)
      expect(@e_reader.lines).to eq(expected_lines)
    end
  end

  context 'grabbing and counting characters' do
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

  context 'translation' do
    it '#translate_english converts english chars to braille' do
      expected = [
        ['O', '.', "\n", '.', '.', "\n", '.', '.'], ['O', '.', "\n", '.', '.', "\n", '.', '.'],
        ['O', '.', "\n", '.', '.', "\n", '.', '.'], ['O', '.', "\n", '.', '.', "\n", '.', '.'],
        ['O', '.', "\n", '.', '.', "\n", '.', '.'], ['O', '.', "\n", '.', '.', "\n", '.', '.'],
        ['O', '.', "\n", '.', '.', "\n", '.', '.'], ['O', '.', "\n", '.', '.', "\n", '.', '.'],
        ['O', '.', "\n", '.', '.', "\n", '.', '.'], ['O', '.', "\n", '.', '.', "\n", '.', '.'],
        ['O', '.', "\n", '.', '.', "\n", '.', '.'], ['O', '.', "\n", '.', '.', "\n", '.', '.'],
        ['O', '.', "\n", '.', '.', "\n", '.', '.'], ['O', '.', "\n", '.', '.', "\n", '.', '.'],
        ['O', '.', "\n", '.', '.', "\n", '.', '.']
      ]
      actual = @e_reader.translate_english(@string1)

      expect(actual).to eq(expected)

    end

    it 'can translate different characters' do
      expected = [
        ['O', '.', "\n", 'O', '.', "\n", '.', '.'], ['O', '.', "\n", 'O', '.', "\n", '.', '.'],
        ['O', '.', "\n", 'O', '.', "\n", '.', '.'], ['O', '.', "\n", 'O', '.', "\n", '.', '.'],
        ['O', '.', "\n", 'O', '.', "\n", '.', '.'], ['O', '.', "\n", 'O', '.', "\n", '.', '.'],
        ['O', '.', "\n", 'O', '.', "\n", '.', '.'], ['O', '.', "\n", 'O', '.', "\n", '.', '.'],
        ['O', '.', "\n", 'O', '.', "\n", '.', '.'], ['O', '.', "\n", 'O', '.', "\n", '.', '.'],
        ['O', '.', "\n", 'O', '.', "\n", '.', '.'], ['O', '.', "\n", 'O', '.', "\n", '.', '.'],
        ['O', '.', "\n", 'O', '.', "\n", '.', '.'], ['O', '.', "\n", 'O', '.', "\n", '.', '.'],
        ['O', '.', "\n", 'O', '.', "\n", '.', '.']
      ]
      actual = @e_reader.translate_english(@string2)

      expect(actual).to eq(expected)
    end
  end

  context 'writing in braille' do
    before :each do
      @e_reader_2 = EnglishReader.new(@file3, @file4)
      @e_reader_3 = EnglishReader.new(@file5, @file5)
    end

    it '#write_braille can translate a single letter to a given file' do
      first_expected = ["O.\n", "..\n", '..']
      @e_reader_2.write_braille
      first_actual = File.readlines(@file4)[0..3]

      expect(first_actual).to eq(first_expected)
    end

    it '#write_braille can write multiple letters to a file' do
      second_expected = ["O.O.O.O.O.\n", "..........\n", ".........."]
      @e_reader_3.write_braille
      second_actual = File.readlines(@file6)[0..3]

      expect(second_actual).to eq(second_expected)
    end
  end

end
