def shuffle array
  shuffle_arr = []
  while array.length > 0
    random_index = rand(array.length)
    curr_index = 0
    new_array = []
    array.each do |var|
      if curr_index == random_index
        shuffle_arr.push var
      else
        new_array.push var
      end
      curr_index = curr_index + 1
    end
    array = new_array
  end
  shuffle_arr
end

puts(shuffle([1,2,3,4,5,6,7,8,9,0]))