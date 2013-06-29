puts 'Hi there sonny!'
byeCount = 0
while true
	input = gets.chomp
	if input == 'BYE' && byeCount < 3
		byeCount = byeCount + 1
	else
		byeCount = 0
	end
		if byeCount > 2
		puts "Bye sonny boy"
		break
		end
			if input == input.downcase 
			puts 'HUH SPEAK UP SONNY!'
			else input == input.upcase && input != 'BYE'
			ranNum = rand(22) + 30
			puts 'Not since 19' + ranNum.to_s + '.'
			end
	
end