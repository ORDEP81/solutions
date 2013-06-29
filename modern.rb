def romanNum num 
	one =(num % 10)
	tens = (num % 100/10)
	hundreds = (num % 1000/100)
	thousands = (num / 1000)
	roman = "M" * thousands
	if hundreds == 9
		roman = roman + 'CM'
	elsif hundreds == 4
		roman = roman + 'CD'
	else 
		roman = roman + 'D' * (num % 1000 / 500)
		roman = roman + 'C' * (num % 500 / 100)
	end
	if tens == 9
		roman = roman + 'XC'
	elsif tens == 4
		roman = roman + 'XL'
	else 
		roman = roman + 'L' * (num % 100/50)
		roman = roman + 'X' * (num % 50 /10)
	end
	if one == 9
		roman = roman + 'IX'
	elsif one ==4
		roman = roman + 'IV'
	else
		roman = roman + 'V' * (num % 10/5)
		roman = roman + 'I' * (num % 5/1)
	end
	roman
end
puts 'The year 2013 in modern roman numerals is: ' + romanNum(2013)