puts "Enter your first number"
num1 = gets.chomp
puts "Enter your second number"
num2 = gets.chomp

puts "What what would you like to do, with you numbers #{num1} and #{num2}"
puts "Enter 1 to add, 2 to subtract, 3 to multiply, 4 to divide"
choice = gets.chomp

total = nil
if choice == 1.to_s
  total = num1.to_i + num2.to_i
  puts "#{num1} + #{num2} = " + total.to_s
elsif choice == 2 .to_s
  total = num1.to_i - num2.to_i
  puts "#{num1} - #{num2} = " + total.to_s
elsif choice == 3.to_s
  total = num1.to_i * num2.to_i
  puts "#{num1} x #{num2} = " + total.to_s
elsif choice == 4.to_s
  total = num1.to_f / num2.to_f
  puts "#{num1} / #{num2} = " + total.to_s
else
  puts "Please enter a choice either 1,2,3,4"
end