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
	list = read_from_file "input.txt"
	str = read_from_file "text.txt"
	str1 = "sdakjflj1232lkfsj13.10.2012dljf9023u4jfkjs0u1314.10.2000"
	puts "Исходный список: " + list.to_s 
	puts "Исходная строка: " + str1
	puts "Исходная строка: " + str
	puts "1. 6-ая задача\n2. 8-ая задача\n3. 12-ая задача\n4. 18-ая задача"
	print "Выберите задачу: "

	answer = gets.chomp.to_i
	print "Ответ: "
	case answer
	when 1
		puts (task_6 str).to_s
	when 2
		puts (task8 list).to_s
	when 3
		puts (task_12 str1).to_s
	when 4
		puts (task_18 str1).to_s
	else
		puts "Нет такой задачи"
	end
end

main()