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

def main
	if ARGV.length < 1 || ARGV.length > 2
		puts "Нужно ввести два аргумента!"
		puts "Для справки выполните скрипт с аргументом '-h'"
	elsif ARGV[0] == '-h' && ARGV.length == 1
		puts "Первый аргумент - выбор метода."
			puts "Второй аргумент- число, для которого вы хотите получить результат."
			puts "Количество методов: 3."
			puts "1. Первый метод."
			puts "2. Второй метод."
			puts "3. Третий метод."
	elsif ARGV[0] != '-h' && ARGV.length == 1
		puts "Для справки выполните скрипт с аргументом '-h'"
	else
		case ARGV[0]
		when '1'
			puts sum_noprime_div ARGV[1].to_i
		when '2'
			puts count_less_three ARGV[1].to_i
		when '3'
			puts complex_condition ARGV[1].to_i
		else
			puts "Нет такого метода!"
		end
	end
end

main()