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

def main
	lines = read_from_file "lines.txt"	
	p task14 lines	
end


main