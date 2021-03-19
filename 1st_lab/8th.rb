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
	if ARGV.length == 0
		puts "Нужно ввести хотя бы один аргумент!"
		puts "Для справки выполните скрипт с аргументом '-h'"
	elsif ARGV[0] == '-h' && ARGV.length == 1
		puts "Максимальное количество аргументов: 7."
		puts "1. Первый метод - сумма цифр числа."
		puts "2. Второй метод - произведение цифр числа."
		puts "3. Третий метод - минимальная цифра числа."
		puts "4. Четвертый метод - максимальная цифра числа."
		puts "5. Пятый метод - сумма непростых делителей числа."
		puts "6. Шестой метод - количество цифр числа, меньших 3."
		puts "7. Седьмой метод - сложное условие для числа."
	else
		print "Введите число: "
		number = STDIN.gets.chomp
		ARGV.each do |meth|
			case meth
				when '1'
					puts sum number.to_i
				when '2'
					puts prod number.to_i
				when '3'
					puts min number.to_i
				when '4'
					puts max number.to_i
				when '5'
					puts sum_noprime_div number.to_i
				when '6'
					puts count_less_three number.to_i
				when '7'
					puts complex_condition number.to_i
				else
					puts "Нет такого метода!"
			end
		end	
	end
end

main()