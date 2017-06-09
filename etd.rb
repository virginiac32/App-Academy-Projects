require 'byebug'

# O(n^2)
def my_min(list)
  prc = Proc.new { |x, y| x <=> y }
  minimum = nil
  # debugger
  list.each do |el|
    min = true
    list.each do |el2|
      min = false if prc.call(el, el2) == 1
    end
    minimum = el if min
  end

  minimum
end

#O(n)
def my_min_once(list)
  min = list[0]
  list[1..-1].each do |el|
    min = el if el < min
  end
  min
end


# n^3
def largest_con_subsum_1(list)
  counter1 = 0
  subarrays = []
  max = list.first

  while counter1 < list.length
    counter2 = counter1
    while counter2 < list.length
      subarrays << list[counter1..counter2]
      counter2 += 1
    end
    counter1 += 1
  end

  subarrays.each do |subarray|
    sub_add = subarray.reduce(:+)
    max = sub_add if sub_add > max
  end

  max
end


# O(n) time w/ O(1) memory
def largest_con_subsum_2(list)
  max_max = list.first
  current_max = list.first

  if list.all? { |el| el < 0}
    return list.max
  end

  list[1..-1].each do |el|
    if current_max + el < 0
      current_max = 0
    else
      current_max += el
    end
    max_max < current_max ? max_max = current_max : max_max
  end

  max_max
end
