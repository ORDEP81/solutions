startBottle = 10
currentBottle = startBottle
while currentBottle > 1
	puts currentBottle.to_s + ' bottles of beer on the wall.'
	puts currentBottle.to_s + ' bottles of beer.'
	puts 'take one down pass it around, '
	currentBottle = currentBottle -1
	puts  currentBottle.to_s + ' bottles of beer on the wall!'
end
puts 'one bottle of beer on the wall one bottle of beer.'
puts 'take one down pass it around,'
puts 'no more bottles of beer on the wall.'