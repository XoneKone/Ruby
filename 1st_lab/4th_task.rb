name = ARGV[0]
puts "Привет, #{name}"

puts "Введи команду языка Ruby"

ARGV.pop

ruby_command = gets.chomp


if ruby_command.start_with?('puts') then
	puts "#{ruby_command.delete_prefix('puts \'').delete_suffix('\'')}"
end

puts "Введи команду операционной системы!"

os_command = gets.chomp

puts `#{os_command}`