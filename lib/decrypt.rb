require './lib/enigma'

enigma = Enigma.new

plaintext = File.open(ARGV[0], "r")
eyes_only = plaintext.read

decrypted_message = enigma.decrypt(eyes_only.chomp, ARGV[2], ARGV[3])
secret_message = File.open(ARGV[1], "w")
secret_message.write(decrypted_message[:decryption])
plaintext.close
secret_message.close
puts "Created #{decrypted_message} with the key #{decrypted_message[:key]} and date #{decrypted_message[:date]}."
