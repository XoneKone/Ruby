def read_from_file input
   IO.read(input).lines(chomp:true)
end



def task12 lines
	lines.sort_by { |e|  e.length }
end

def task13 lines
	lines.sort_by { |e| e.split.length }
end

def task14 lines
	lines.sort_by { |e| e.split.index {|e| e =~ /[\d]/} != nil ? e.split.length - e.split.index {|e| e =~ /[\d]/} - 1  : 0}
end

def freq str
	count_list = (str.split.map { |e| str.count(e) })
	most_often = count_list.index(count_list.max)
	str.count(str[most_often]).to_f / str.length
end

def palindrom str
	(str.split.select { |e| e == e.reverse && e.length == 3}).length.to_f / str.split.length
end

def task3 lines
	lines.sort_by { |e| freq e}
end

def task6 lines
	
end

def task9 lines
end

def task10 lines
	lines.sort_by { |e| palindrom e}
end


def main
	lines = read_from_file "lines.txt"	
	p lines[4]
	p  task10 lines
end


main