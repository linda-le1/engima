require './lib/key_generator'
require './lib/decrypt'
require './lib/encryption'
require 'date'

class Enigma

  def encrypt(message, key, date)
    Encryption.new.encryption(message, key, date)
  end

  def decrypt(message, key, date= nil)
    Decrypt.new
  end

end
