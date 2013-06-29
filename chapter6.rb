puts "WHAT IS IS THAT YOU WANT?!?!"
response = gets.chomp
puts "WHAT DO YOU MEAN, " + response.upcase + "?!?" " YOU\'RE FIRED!!"

#modified for arrays chapter
array = [['Getting Started', 1],['Numbers', 9],['Letters', 13]]
line_width = 40
puts ('Table of Contents'.center(line_width))
chapterNum = 1
array.each do |arrVar|
	chapName = arrVar[0]
	pageNum = arrVar[1]
	start = 'Chapter ' + chapterNum.to_s + ': ' + chapName
	ending = 'page ' + pageNum.to_s
	puts start.ljust(30) + ending.rjust(20)
	chapterNum = chapterNum + 1
end
