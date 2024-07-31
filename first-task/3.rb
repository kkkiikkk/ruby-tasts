# frozen_string_literal: true

puts 'Enter properties of matrix'
puts 'Column size: '
columns = gets.chomp.to_i

puts 'Raws size: '
raws = gets.chomp.to_i

(0...raws).each do |i|
  arr = []
  arr.fill(0, 0...columns)
  arr[i] = 1 if i < columns
  p arr
end
