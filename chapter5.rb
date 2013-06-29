puts "Hello, what is your first name?"
fName = gets.chomp
puts "How about your middle name?"
mName = gets.chomp
puts "Now your last name?"
lName = gets.chomp

puts "Nice to meet you " + fName + " " + mName + " " + lName + " !"

puts fName + ", What is your favorite number?"
favNum = gets.chomp
newNum = favNum.to_i + 1
puts "I dont like " + favNum.to_s + " , how about " + newNum.to_s