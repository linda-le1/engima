require './lib/key_generator'
require './lib/decryption'
require './lib/encryption'
require './lib/enigma'

enigma = Enigma.new
# p enigma.encrypt("hello world", "02715", "040895")
#
# p enigma.decrypt("keder ohulw", "02715", "040895")

p enigma.encrypt("david")
