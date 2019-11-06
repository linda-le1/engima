require './lib/enigma'

enigma = Enigma.new

file_1 = File.open(ARGV[0], "r")
message_to_encrypt = file_1.read

encrypted_message = enigma.encrypt(message_to_encrypt.chomp)
file_2 = File.open(ARGV[1], "w")
file_2.write(encrypted_message[:encryption])
file_1.close
file_2.close
puts "Created #{encrypted_message} with the key #{encrypted_message[:key]} and date #{encrypted_message[:date]}."
