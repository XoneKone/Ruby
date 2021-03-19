def read_from_file input
   IO.read(input).chomp
end


def task_10 str
	new_str = (str.scan(/([0-2]\d|3[0-1]) (января|февраля|марта|апреля|мая|июня|июля|августа|сентября|октября|ноября|декабря) (\d{4})/).map {|e| e.join(' ')})
end

def task_6 str
	new_str = str.scan(/\d{1,}/).count {|e| e.to_i < 5}
end

def task_12 str
	alp = "абвгдеёжзийклмнопрстуфхцчшщъыьэюя"
	(alp.scan(/[а-я]/) - str.gsub(/[\d ]/,'').scan(/[а-я]/)).count
end

def task_18 str
	 (str.scan(/\d+/).sort_by {|e| e.length})[-1].length
end

def main

	str = read_from_file 'date.txt'
	puts "Исходная строка: " + str
	puts "1. 6-ая задача\n2. 10-ая задача\n3. 12-ая задача\n4. 18-ая задача"
	print "Выберите задачу: "

	answer = gets.chomp.to_i
	print "Ответ: "
	case answer
	when 1
		puts (task_6 str).to_s
	when 2
		puts (task_10 str).to_s
	when 3
		puts (task_12 str).to_s
	when 4
		puts (task_18 str).to_s
	else
		puts "Нет такой задачи"
	end
end


main()