number = ARGV[0]
number = number.to_i
sum = 0

number.digits.each do |x|
	sum += x
end

puts sum