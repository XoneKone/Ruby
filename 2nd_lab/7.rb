
def read_from_file input
  list = IO.read(input).chomp.split
  return list.map! {|e| e.to_i}
end

=begin
12. Дан целочисленный массив. Необходимо переставить в обратном
порядке элементы массива, расположенные между его минимальным и
максимальным элементами.	
=end

def task_12 list
	ind_min = list.index(list.min)
	ind_max = list.index(list.max)

	if ind_min > ind_max
		ind_min, ind_max = ind_max, ind_min
	end

	list[ind_min+1...ind_max] = list[ind_min+1...ind_max].reverse
	return list 
end

=begin
24. Дан целочисленный массив. Необходимо найти два наибольших
элемента.	
=end

def task_24 list
	return list.sort[-2..-1]
end

=begin
36. Дан целочисленный массив. Необходимо найти максимальный
нечетный элемент.
=end

def task_36 list
	return (list.select{|e| e % 2 != 0}).max
end

=begin
48. Для введенного списка построить список с номерами элемента, который
повторяется наибольшее число раз.
=end

def task_48 list
	

	
end

=begin
60. Дан список. Построить массив из элементов, делящихся на свой
номер и встречающихся в исходном массиве 1 раз.	
=end

def task_60 list
	res = []
	i = 0
	while i < list.length
		count = 0
		current = list[i]
		for j in (0...list.length)
			if list[j] == current
				count += 1
			end
		end
		if count == 1 && current % (i+1) == 0
			res << current
		end
		i+=1
	end

	return res
end

def main
	list = read_from_file "input.txt"
	puts "Исходный список: " + list.to_s 
	puts "1. 12-ая задача\n2. 24-ая задача\n3. 36-ая задача\n4. 48-ая задача\n5. 60-ая задача"
	print "Выберите задачу: "

	answer = gets.chomp.to_i
	print "Ответ: "
	case answer
	when 1
		puts (task_12 list).to_s
	when 2
		puts (task_24 list).to_s
	when 3
		puts (task_36 list).to_s
	when 4
		puts (task_48 list).to_s
	when 5
		puts (task_60 list).to_s
	else
		puts "Нет такой задачи"
	end
end

main()