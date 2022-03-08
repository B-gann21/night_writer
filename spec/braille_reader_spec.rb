require './lib/braille_reader'

describe BrailleReader do
  before :each do
    @braille_a = ['O.', '..', '..']
    @braille_b = ['O.', 'O.', '..']
    @file1 = './spec/message_test_5.txt'
    @file2 = './spec/braille_test_5.txt'
    @b_reader = BrailleReader.new(@file2, @file1)
  end

  context 'initialization' do
    it 'exists' do
      expect(@b_reader).to be_a(BrailleReader)
    end

    it 'can print an info message' do
      expected = 'Created message_test_5.txt containing 1 characters'
      expect(@b_reader.info_msg).to eq(expected)
    end
  end

  context 'translation' do
    it '#translate_braille converts braille chars to english' do
      actual = @b_reader.translate_braille(@braille_a)

      expect(actual).to eq("a")
    end

    it 'can translate different characters' do
      actual = @b_reader.translate_braille(@braille_b)

      expect(actual).to eq("b")
    end
  end

  context 'writing in english' do
    it '#write_english can write a single character in english' do
      expected = ["a"]
      @b_reader.write_english
      actual = File.readlines(@file1)

      expect(actual).to eq(expected)
    end

    it 'can write more than one character' do
      @file3 = './spec/braille_test_6.txt'
      @file4 = './spec/message_test_6.txt'
      @b_reader2 = BrailleReader.new(@file3, @file4)

      expected = ["aaaaa"]
      @b_reader2.write_english
      actual = File.readlines(@file4)

      expect(actual).to eq(expected)
    end

    it 'can write multiple different characters' do
      @file5 = './spec/braille_test_7.txt'
      @file6 = './spec/message_test_7.txt'
      @b_reader3 = BrailleReader.new(@file5, @file6)

      expected = ['abcdefghijklmnopqrstuvwxyz']
      @b_reader3.write_english
      actual = File.readlines(@file6)

      expect(actual).to eq(expected)
    end
  end
end
