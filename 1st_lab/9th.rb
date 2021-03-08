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
