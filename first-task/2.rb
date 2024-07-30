puts "Enter readius of the future circle: "
radius = gets.chomp.to_i
r_in = radius - 0.4
r_out = radius + 0.4

(radius.downto(-radius)).each do |y|
  (-radius..r_out).step(0.5).each do |x|
    value = x * x + y * y
    if value >= r_in * r_in && value <= r_out * r_out
       print "*"
    else
      print " "
    end
  end
  puts
end