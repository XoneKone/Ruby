def first_method
  puts 'Введите список'
  list = gets.chomp.split.map { |e| e.to_i  }
  puts list
  puts min list
  puts max list
  puts sum list
  puts prod list
end

def min list
  list.min
end

def max list
 list.max
end

def sum list
  list.inject(0,:+)
end

def prod list
  list.inject(1,:*)
end

puts first_method
