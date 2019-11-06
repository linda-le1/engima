require './lib/key_generator'
require './lib/decrypt'
require './lib/encryption'

class Enigma

  def encrypt(message, key = nil, date = nil)
    Encryption.new
  end

  def decrypt(message, key = nil, date= nil)
    Decrypt.new
  end

end
