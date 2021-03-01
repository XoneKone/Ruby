def sum number
	sum = 0
	number.digits.each do |x|
		sum += x
	end
	return sum
end

def prod number
	prod = 1
	number.digits.each do |x|
		prod *= x
	end
	return prod
end

def max number
	return number.digits.sort[-1]
end

def min number
	return number.digits.sort[0]
end

puts min 1234
puts max 1234
puts prod 1234
puts sum 1234