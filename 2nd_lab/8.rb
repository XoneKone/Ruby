def read_from_file input
   IO.read(input).chomp.split
end

def task8 str
	(str.map { |e| e.to_i }).max
end

def main
	str = read_from_file "input.txt"
	puts  task8 str
end 

main