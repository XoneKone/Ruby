
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
	max = list[0]
	i_max = 0
	min = list[0]
	i_min = 0
	i = 1
	while i < list.length
		if max < list[i]
			max = list[i]
			i_max = i
		end
		if min > list[i]
			min = list[i]
			i_min = i
		end
		i += 1
	end

	if i_min > i_max
		i_min, i_max = i_max, i_min
	end

	i_max -= 1
	i_min += 1
	j = 0

	while j <= (i_max - i_min)/2
		list[i_min + j], list[i_max - j] = list[i_max - j], list[i_min + j]
		j += 1
	end

	return list 
end

=begin
24. Дан целочисленный массив. Необходимо найти два наибольших
элемента.	
=end

def task_24 list
	max_el = [0,0]
	i = 1
	while i < list.length
		if list[max_el[0]] < list[i]
			if list[i] > list[max_el[1]]
				max_el[0], max_el[1] = max_el[1], i
			else
				max_el[0] = i
			end
		end
		i += 1
	end
	return [list[max_el[0]],list[max_el[1]]]
end

=begin
36. Дан целочисленный массив. Необходимо найти максимальный
нечетный элемент.
=end

def task_36 list
	max_el = list[0] % 2 != 0 ? list[0]: -1
	i = 1
	while i < list.length
		if list[i] > max_el && list[i] % 2 != 0
			max_el = list[i]
		end
		i+=1
	end
	return max_el
end

=begin
48. Для введенного списка построить список с номерами элемента, который
повторяется наибольшее число раз.
=end

def task_48 list
	ind, max_el = 0, 0
	i = 0
	while i < list.length
		count = 0
		current = list[i]
		for j in (0...list.length)
			if list[j] == current
				count += 1
			end
		end
		if count > max_el
			max_el = count
			ind = i
		end
		i+=1
	end

	res = []
	for i in (0...list.length)
		if list[ind] == list[i]
			res << i
		end
	end

	return res
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
	puts task_60 list
end

main()