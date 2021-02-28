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

end

def complex_condition number

end