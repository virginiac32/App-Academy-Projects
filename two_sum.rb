require 'byebug'
def bad_two_sum?(arr, target_sum)
  pairs = arr.combination(2).to_a
  pairs.each do |pair|
    return true if pair.reduce(:+) == target_sum
  end
  false
end


def okay_two_sum?(arr, target_sum)
  sorted = arr.sort!
  return false if sorted.last + sorted[-2] < target_sum
  return false if sorted[0] + sorted[1] > target_sum

  i = 0
  while i < arr.length
    sorted.each_with_index do |el, idx|
        return true if sorted[i] + el == target_sum && idx != i
    end
    i+=1
  end

  false
end

  # prc = Proc.new { |x, y, z| x + y <=> z }
  # mid = sorted.count / 2
  # case prc.call(sorted[mid], sorted[mid + 1], target_sum)
  # when -1
  #   okay_two_sum(sorted.take(mid - 1))
  # when 0
  #   return true
  # when 1
  #   okay_two_sum(sorted.drop(mid)) + mid + 1
  # end
  #
  # false


def great_two_sum?(arr,target_sum)
  hash = Hash.new(0)

  arr.each do |el|
    hash[el] += 1
  end
  # debugger
  p hash
  hash.each do |k, v|
    if hash.key?(target_sum - k)
      if k*2 == target_sum && hash[k]>=2
        return true
      else
        return false
      end
      return true
    end
  end

  false
end
