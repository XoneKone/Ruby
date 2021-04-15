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
	lines.sort_by { |e| e.split.index {|e| e =~ /[\d]/} != nil ? e.split.length - e.split.rindex {|e| e =~ /[\d]/} - 1  : 0}
end

def freq str
	count_list = (str.split.map { |e| str.count(e) })
	most_often = count_list.index(count_list.max)
	str.count(str[most_often]).to_f / str.length
end

def palindrom str
	(str.split.select { |e| e == e.reverse && e.length == 3}).length.to_f / str.split.length
end

def asci_codes str
	codes = []
	str.gsub(/ /,'').each_codepoint { |e| codes << e}
	return codes
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
	puts "Исходный текст: "
	p lines
	puts "1. 3-ая задача\n2. 10-ая задача\n3. 12-ая задача\n4. 13-ая задача\n5. 14-ая задача"
	print "Выберите задачу: "

	answer = gets.chomp.to_i
	print "Ответ: "
	case answer
	when 1
			puts (task3 lines).to_s
	when 2
		puts (task10 lines).to_s
	when 3
		puts (task12 lines).to_s
	when 4
		puts (task13 lines).to_s
	when 5
		puts (task14 lines).to_s
	else
		puts "Нет такой задачи"
	end
end


main