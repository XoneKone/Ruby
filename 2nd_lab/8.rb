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

def task_18 str
	new_str = (str.scan(/([0-2]\d|3[0-1]).(0[1-9]|1[0-2]).(\d{4})/).map {|e| e.join('.')})
end

def main
	str = read_from_file "text.txt"
	str1 = "sdakjflj1232lkfsjdljf9023u4jfkjs0u13"
	p  task_18 "14.10.2000sdafasd213.324.23asdee12.12.2001"
end 

main