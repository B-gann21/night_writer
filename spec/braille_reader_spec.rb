require './lib/braille_reader'

describe BrailleReader do
  before :each do
    @braille_a = ['O.', '..', '..']
    @braille_b = ['O.', 'O.', '..']
    @file1 = './spec/test_files/message_test_5.txt'
    @file2 = './spec/test_files/braille_test_5.txt'
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

  context '#formatted_braille' do
    it 'can split a braille character into an array' do
      expected = ['O.', '..', '..']
      eng_file1 = './spec/test_files/message_test_5.txt'
      braille_file1 = './spec/test_files/braille_test_5.txt'
      braille = File.readlines(braille_file1)
      b_reader1 = BrailleReader.new(braille_file1, eng_file1)

      expect(b_reader1.formatted_braille[0]).to eq(expected)
    end

    it 'can format multiple braille characters' do
      expected = [['O.', '..', '..'], ['O.', '..', '..'], ['O.', '..', '..'], ['O.', '..', '..'], ['O.', '..', '..']]
      eng_file2 = './spec/test_files/message_test_3.txt'
      braille_file2 = './spec/test_files/braille_test_3.txt'
      b_reader2 = BrailleReader.new(braille_file2, eng_file2)

      expect(b_reader2.formatted_braille).to eq(expected)
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
      @file3 = './spec/test_files/braille_test_6.txt'
      @file4 = './spec/test_files/message_test_6.txt'
      @b_reader2 = BrailleReader.new(@file3, @file4)

      expected = ["aaaaa"]
      @b_reader2.write_english
      actual = File.readlines(@file4)

      expect(actual).to eq(expected)
    end

    it 'can write multiple different characters' do
      @file5 = './spec/test_files/braille_test_7.txt'
      @file6 = './spec/test_files/message_test_7.txt'
      @b_reader3 = BrailleReader.new(@file5, @file6)

      expected = ['abcdefghijklmnopqrstuvwxyz']
      @b_reader3.write_english
      actual = File.readlines(@file6)

      expect(actual).to eq(expected)
    end
  end
end
