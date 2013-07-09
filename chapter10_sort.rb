def sort arr
  recur_sort arr, []
end
def recur_sort unsorted_arr, sorted_arr
   if unsorted_arr.length <= 0
    return sorted_arr
end
small_word = unsorted_arr.pop
still_unsorted = []
unsorted_arr.each do |checked|
  if checked < small_word
    still_unsorted.push small_word
    small_word = checked
  else
  still_unsorted.push checked
  end
end
sorted_arr.push small_word
recur_sort still_unsorted,sorted_arr
end

puts (sort(['dodgers', 'giants', 'yankees','braves', 'cubs']))
