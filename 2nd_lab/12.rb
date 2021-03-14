def read_from_file input
   IO.read(input).lines(chomp:true)
end



def task12 lines
	lines.sort_by { |e|  e.length }
end


def main
	lines = read_from_file "lines.txt"	
	puts task12 lines
end


main