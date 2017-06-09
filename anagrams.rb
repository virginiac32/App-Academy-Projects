require "byebug"

# O(n!)
def first_anagram?(str1, str2)
  str1.chars.permutation.to_a.include?(str2.chars)
end

# O(2n)
def second_anagram?(str1, str2)
  # debugger
  str1.each_char do |char|
    if str2.include?(char)
      str2.delete!(char)
      str1.delete!(char)
    end
  end

  str1.empty? && str2.empty?
end

# O(n lg n)
def third_anagram?(str1, str2)
  str1.chars.sort! == str2.chars.sort!
end

# O(n)
def fourth_anagram?(str1, str2)
  str1_hash = Hash.new(0)
  str2_hash = Hash.new(0)

  str1.each_char.with_index do |char, idx|
    str1_hash[str1[idx]] += 1
    str2_hash[str2[idx]] += 1
  end

  str1_hash == str2_hash
end

# O(n)
def bonus_anagram?(str1, str2)
  hash = Hash.new(0)

  str1.each_char.with_index do |chars, idx|
    hash[str1[idx]] += 1
    hash[str2[idx]] -= 1
  end

  hash.values.all? { |value| value == 0 }
end
