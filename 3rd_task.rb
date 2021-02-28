name = ARGV[0]
puts "Привет, #{name}"

puts "Какой язык программирования у тебя любимый?"

ARGV.pop

lang = gets.chomp

unless lang == "Ruby" then
	puts "Скоро полюбишь Ruby!"
else
	puts "Ты подлиза :)"
end