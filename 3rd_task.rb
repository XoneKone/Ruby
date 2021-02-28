name = ARGV[0]
puts "Привет, #{name}"

puts "Какой язык программирования у тебя любимый?"

ARGV.pop

lang = gets.chomp

case lang
when "Ruby"
	puts "Ты подлиза :)"
when "C++"
	puts "А ты хорош!"
when "Python"
	puts "Ого, Датасаентист"
else
	puts "Скоро полюбишь Ruby!"	
end