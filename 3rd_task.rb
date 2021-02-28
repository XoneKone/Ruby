name = ARGV[0]
puts "Привет, #{name}"

puts "Какой язык программирования у тебя любимый?"

ARGV.pop

lang = gets.chomp

if lang == "Ruby" then
	puts "Ты подлиза"
elsif lang == "C++" then
	puts "Ты красавчик!"
elsif lang == "Python" then
	puts "Ого, датасаентист!"
else
	puts "Скоро полюбишь Ruby :)"
end