require './lib/enigma'

enigma = Enigma.new

file_1 = File.open(ARGV[0], "r")
message_to_decrypt = file_1.read

decrypted_message = enigma.decrypt(message_to_decrypt.chomp, ARGV[2], ARGV[3])
file_2 = File.open(ARGV[1], "w")
file_2.write(decrypted_message[:decryption])
file_1.close
file_2.close
puts "Created #{decrypted_message} with the key #{decrypted_message[:key]} and date #{decrypted_message[:date]}."
