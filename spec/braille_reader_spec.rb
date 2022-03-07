require './lib/braille_reader'

describe BrailleReader do
  before :each do
    @file1 = './spec/message_test_2.txt'
    @file2 = './spec/braille_test_2.txt'
    @b_reader = BrailleReader.new(@file2, @file1)
  end

  context 'initialization' do
    it 'exists' do
      expect(@b_reader).to be_a(BrailleReader)
    end

    it 'can print an info message' do
      expected = 'Created message_test_2.txt containing 1 characters'
      expect(@b_reader.info_message).to eq(expected)
    end
  end
end
