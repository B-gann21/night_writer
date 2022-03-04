require 'rspec'
require './lib/english_reader'

describe EnglishReader do
  before :each do
    @string1 = 'aaaaaaaaaaaaaaa'
    @string2 = 'bbbbbbbbbbbbbbb'
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
        ['O', '.', '.', '.', '.', '.' ], ['O', '.', '.', '.', '.', '.' ],
        ['O', '.', '.', '.', '.', '.' ], ['O', '.', '.', '.', '.', '.' ],
        ['O', '.', '.', '.', '.', '.' ], ['O', '.', '.', '.', '.', '.' ],
        ['O', '.', '.', '.', '.', '.' ], ['O', '.', '.', '.', '.', '.' ],
        ['O', '.', '.', '.', '.', '.' ], ['O', '.', '.', '.', '.', '.' ],
        ['O', '.', '.', '.', '.', '.' ], ['O', '.', '.', '.', '.', '.' ],
        ['O', '.', '.', '.', '.', '.' ], ['O', '.', '.', '.', '.', '.' ],
        ['O', '.', '.', '.', '.', '.' ]
      ]
      actual = @e_reader.translate_english(@string1)

      expect(actual).to eq(expected)

    end

    it 'can translate different characters' do
      expected = [
        ['O', '.', 'O', '.', '.', '.' ], ['O', '.', 'O', '.', '.', '.' ],
        ['O', '.', 'O', '.', '.', '.' ], ['O', '.', 'O', '.', '.', '.' ],
        ['O', '.', 'O', '.', '.', '.' ], ['O', '.', 'O', '.', '.', '.' ],
        ['O', '.', 'O', '.', '.', '.' ], ['O', '.', 'O', '.', '.', '.' ],
        ['O', '.', 'O', '.', '.', '.' ], ['O', '.', 'O', '.', '.', '.' ],
        ['O', '.', 'O', '.', '.', '.' ], ['O', '.', 'O', '.', '.', '.' ],
        ['O', '.', 'O', '.', '.', '.' ], ['O', '.', 'O', '.', '.', '.' ],
        ['O', '.', 'O', '.', '.', '.' ]
      ]
      actual = @e_reader.translate_english(@string2)

      expect(actual).to eq(expected)
    end
  end

end
