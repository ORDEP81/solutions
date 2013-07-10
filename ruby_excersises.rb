arr =[1,2,3,4,5,6,7,8,9,10]
arr.each {|a| puts a }

arr.each  {|a| puts a if a >5}

arr.select {|a| a.odd?}

arr << 11
arr.unshift(0)

arr.pop
arr << 3

arr.uniq

h={:a => 1, b =>2, c=>3}
h={a: 1, b: 2, c: 3}

h[d:] = 4
h.delete_if {|k,v| v < 3.5}

h[a:1, b:[21,33,55]]
arr = [{a:2},{b:2},{c:4}]

