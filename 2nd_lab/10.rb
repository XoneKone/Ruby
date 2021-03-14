def read_from_file input
   IO.read(input).chomp
end


def task_10 str
	new_str = (str.scan(/([0-2]\d|3[0-1]) (января|февраля|марта|апреля|мая|июня|июля|августа|сентября|октября|ноября|декабря) (\d{4})/).map {|e| e.join(' ')})
end


def main
	str = read_from_file 'date.txt'
	puts task_10 str

end


main()