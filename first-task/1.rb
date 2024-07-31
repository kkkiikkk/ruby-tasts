# frozen_string_literal: true

moments = [10, 20, 25]

(1..30).each do |i|
  msg = moments.include?(i) ? 'ruby' : '<3ruby'
  puts msg
end
