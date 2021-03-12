def first_method
  size = ARGV[0].to_i
  list = read_list size
  puts min list
  puts max list
  puts sum list
  puts prod list
  print list
  
end

def read_list size
  puts 'Введите элементы:'
  list = []
  0.upto(size-1) do |i|
    el = STDIN.gets.to_i  
    list.concat([el])
  end
  return list
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
