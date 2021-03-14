def read_from_file input
   IO.read(input).chomp.split
end

def task8 str
	(str.map { |e| e.to_i }).max
end

def task_6 str
	str.map { |e| e[0] + e[1...-1].split('').shuffle.join + e[-1]}
end

def task_12 str
	new_str = str.gsub(/[^\d]/,'') + str.gsub(/[\d]/,'') 
end

def main
	str = read_from_file "text.txt"
	str1 = "sdakjflj1232lkfsjdljf9023u4jfkjs0u13"
	p  task_12 str1
end 

main