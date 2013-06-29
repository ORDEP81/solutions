puts 'type a word to a line, press enter on empty line to finish'
wordList = []
while true
	word = gets.chomp
	wordList.push word
	puts ''
	puts wordList.sort
	puts ''
if word == ''
	break
end
end
