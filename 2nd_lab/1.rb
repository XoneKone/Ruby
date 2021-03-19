def first_method
  if ARGV.length != 0 
    if ARGV[0] == '1'
      puts "Введите размер списка: "
      size = STDIN.gets.chomp.to_i
      list = read_list size
    elsif ARGV[0] == '2'
      list = read_from_file ARGV[1]
    end
  else
    puts "Нет аргумента"
  end
  print list
end

def read_list size
  puts 'Введите элементы:'
  list = []
  0.upto(size-1) do |i|
    el = STDIN.gets.to_i  
    list.push(el)
  end
  return list
end

def read_from_file input
  list = IO.read(input).chomp.split
  return list.map! {|e| e.to_i}
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


first_method
