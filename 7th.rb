def sum_noprime_div number
	sum = 0
	if number > 3 then
		number.downto(3) do |n|
			if is_prime(n) == false && number % n == 0 then
				sum += n
			end
		end
	end
	return sum
end

def is_prime number
	(number-1).downto(2) do |n|
		if number.gcd(n) != 1 then
			return false
		end
	end 
	return true
end


def count_less_three number
	count = 0
	number.digits.each do |x|
		if x < 3 then 
			count += 1
		end
	end
	return count
end

def complex_condition number
	count = 0
	(number-1).downto(1) do |n|
		if number % n != 0 && number.gcd(n) != 1 && n.gcd(sum_prime(number)) == 1 then
			count += 1
		end
	end
	return count
end

def sum_prime number
	sum = 0
	number.digits.each do |x|
		if is_prime(x) then
			sum += x
		end
	end
	return sum
end
