require './lib/braille_reader'

describe BrailleReader do
  before :each do
    @braille_a = ['O.', '..', '..']
    @braille_b = ['O.', 'O.', '..']
    @file1 = './spec/message_test_5.txt'
    @file2 = './spec/braille_test_6.txt'
    @b_reader = BrailleReader.new(@file2, @file1)
  end

  context 'initialization' do
    it 'exists' do
      expect(@b_reader).to be_a(BrailleReader)
    end

    it 'can print an info message' do
      expected = 'Created message_test_2.txt containing 1 characters'
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
      expected = "a\n"
      @b_reader.write_english
      actual = File.readlines(@file1)

      expect(actual).to eq(expected)
    end
  end
end
