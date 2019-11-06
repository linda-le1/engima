require './lib/enigma'

enigma = Enigma.new

handler = File.open(ARGV[0], "r")
plaintext = handler.read

eyes_only = enigma.encrypt(plaintext.chomp)
secret_message = File.open(ARGV[1], "w")
secret_message.write(eyes_only[:encryption])
handler.close
secret_message.close
puts "Created #{eyes_only} with the key #{eyes_only[:key]} and date #{eyes_only[:date]}."
