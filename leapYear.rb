puts 'Enter a start year.'
startYear = gets.chomp
puts 'Enter a end year.'
endYear = gets.chomp
puts 'Your start year is: ' + startYear.to_s
puts 'and your end year is: ' + endYear.to_s
puts 'The leap years are : '
counter = startYear
while counter.to_i <= endYear.to_i
	if (counter%4 == 0)
		if (counter%100 !=0 || counter%400 == 0)
			puts counter.to_s
		end
	end
	counter = counter.to_i + 1
end	