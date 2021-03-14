def read_from_file input
   IO.read(input).chomp
end


def task_10 str
	new_str = (str.scan(/([0-2]\d|3[0-1]) (января|февраля|марта|апреля|мая|июня|июля|августа|сентября|октября|ноября|декабря) (\d{4})/).map {|e| e.join(' ')})
end

def task_6 str
	new_str = str.scan(/\d{1,}/).count {|e| e.to_i < 5}
end

def main
	str = read_from_file 'date.txt'
	puts task_6 str

end


main()