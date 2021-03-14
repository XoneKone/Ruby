def read_from_file input
   IO.read(input).lines(chomp:true)
end



def task12 lines
	lines.sort_by { |e|  e.length }
end

def task13 lines
	lines.sort_by { |e| e.scan(/ /).length + 1 }
end

def main
	lines = read_from_file "lines.txt"	
	p task13 lines
	p task12 lines
	
end


main