class Base62
  ALPHABET = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".freeze
  BASE = ALPHABET.length


  def self.encode(number)
    result = ""

    while number > 0 do
      result << ALPHABET[number % BASE]
      number /= BASE
    end
  end

  def self.decode(string)
    # alphabet = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
  end
end
