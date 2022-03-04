require 'rspec'
require './lib/translator'

describe Translator do
  before :each do
    @translator = Translator.new
    @string1 = 'aaaaaaaaaaaaaaa'
    @string2 = 'bbbbbbbbbbbbbbb'
  end

  it 'exists' do
    expect(@translator).to be_a(Translator)
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
      actual = @translator.translate_english(@string1)

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
      actual = @translator.translate_english(@string2)

      expect(actual).to eq(expected)
    end
  end
end
