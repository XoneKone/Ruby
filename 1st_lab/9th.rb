require 'prime'

def sum number
	number.digits.each.inject(0, :+) 
end

def prod number
	number.digits.each.inject(1, :*)
end

def max number
	number.digits.max
end

def min number
	number.digits.min
end



def sum_noprime_div number
	((3..number).select {|n| number % n == 0 && !Prime.prime?(n)}).to_a.inject(0,:+)

end


def count_less_three number
	number.digits.count {|x| x<3}
end

def complex_condition number
	(1...number).to_a.select {|n| (number % n != 0) && (number.gcd(n) != 1) && (n.gcd(number.digits.inject(0) { |mem, var| Prime.prime?(var) ? mem + var : mem  }) == 1)}
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

=begin
	Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
	If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.
	For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

	Evaluate the sum of all the amicable numbers under 10000.
=end 

def d x
	(1...x).inject(0) {|mem,var| x % var == 0 ? mem + var : mem}
end

def problem21
	p(((1..10000).select{|el| d(d(el)) == el && el != d(el)}).inject(0,:+))
end

problem21