module Translator
  def eng_to_braille
    {
      a: ['O.', '..', '..'],  b: ['O.', 'O.', '..'],
      c: ['OO', '..', '..'],  d: ['OO', '.O', '..'],
      e: ['O.', '.O', '..'],  f: ['OO', 'O.', '..'],
      g: ['OO', 'OO', '..'],  h: ['O.', 'OO', '..'],
      i: ['.O', 'O.', '..'],  j: ['.O', 'OO', '..'],
      k: ['O.', '..', 'O.'],  l: ['O.', 'O.', 'O.'],
      m: ['OO', '..', 'O.'],  n: ['OO', '.O', 'O.'],
      o: ['O.', '.O', 'O.'],  p: ['OO', 'O.', 'O.'],
      q: ['OO', 'OO', 'O.'],  r: ['O.', 'OO', 'O.'],
      s: ['.O', 'O.', 'O.'],  t: ['.O', 'OO', 'O.'],
      u: ['O.', '..', 'OO'],  v: ['O.', 'O.', 'OO'],
      w: ['.O', 'OO', '.O'],  x: ['OO', '..', 'OO'],
      y: ['OO', '.O', 'OO'],  z: ['O.', '.O', 'OO'],
      " ": ['..', '..', '..']
    }
    # @braille_to_eng = @eng_to_braille.invert
  end

  def braille_to_eng
    eng_to_braille.invert
  end

  def translate_english(string)
    string.split('').map{|character| eng_to_braille[character.to_sym]}
  end

  def translate_braille(character)
    braille_to_eng[character].to_s
  end
end
