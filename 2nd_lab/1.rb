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
  min_val= 200000
  list.each do |var|
    if var < min_val
      min_val = var
    end
  end
  return min_val
end

def max list
  max_val= -200000
  list.each do |var|
    if var > max_val
      max_val = var
    end
  end
  return max_val
end

def sum list
  sum_val= 0
  list.each do |var|
    sum_val += var
  end
  return sum_val
end

def prod list
  prod_val= 1
  list.each do |var|
    prod_val *= var
  end
  return prod_val
end

puts first_method
