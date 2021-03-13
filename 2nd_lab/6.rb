
def read_from_file input
  list = IO.read(input).chomp.split
  return list.map! {|e| e.to_i}
end

=begin
Дан целочисленный массив. Необходимо переставить в обратном
порядке элементы массива, расположенные между его минимальным и
максимальным элементами.	
=end

def task_12
	list = read_from_file "input.txt"
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

	print list 
end

task_12