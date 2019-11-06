require './lib/key_generator'
require './lib/decryption'
require './lib/encryption'
require 'date'

class Enigma

  def encrypt(message, key = nil, date = nil)
    key_generator = KeyGenerator.new(key, date)
    encrypted_hash = {}
    encrypted_hash[:encryption] = Encryption.new.encryption(message, key_generator)
    encrypted_hash[:key] = key_generator.key.to_s
    encrypted_hash[:date] = key_generator.date.to_s
    encrypted_hash
  end

  def decrypt(message, key, date = nil)
    key_generator = KeyGenerator.new(key, date)
    encrypted_hash = {}
    encrypted_hash[:decryption] = Decryption.new.decryption(message, key_generator)
    encrypted_hash[:key] = key_generator.key.to_s
    encrypted_hash[:date] = key_generator.date.to_s
    encrypted_hash
  end

end
