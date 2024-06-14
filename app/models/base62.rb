class Base62
  ALPHABET = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".freeze
  BASE = ALPHABET.length


  def self.encode(number)
    result = ""

    while number > 0 do
      index = number % 62
      char = ALPHABET[index]
      result.prepend(char)
      number = number / 62
    end
  end

  def self.decode(string)
    # alphabet = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
  end
end
