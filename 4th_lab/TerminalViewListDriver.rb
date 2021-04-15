require_relative 'ListDriver'
require_relative 'Validator'

############################################################################################################
#                                                                                                          #
#                                     Class TerminalViewListDriver                                       #
#                                                                                                          #
############################################################################################################

class TerminalViewListDriver
  include Validator

  attr_accessor :list_driver

  def initialize
    self.list_driver = ListDriver.new('storage.txt')
  end

  def show
    puts list_driver.show
  end

  def add
    begin
      puts 'Введите данные водителя:'

      print 'ФИО: '
      fullname = STDIN.gets.chomp
      until Validator.is_fullname? fullname
        puts "Некоректное ФИО!\nВведите заново: "
        fullname = STDIN.gets.chomp
      end
      fullname = Validator.to_valid_fullname fullname

      print 'Дата рождения: '
      birthdate = STDIN.gets.chomp
      until Validator.is_birthdate? birthdate
        puts "Некоректная дата рождения!\nВведите заново: "
        birthdate = STDIN.gets.chomp
      end
      birthdate = Validator.to_valid_birthdate birthdate

      print 'Номер телефона: '
      mobphone = STDIN.gets.chomp
      until Validator.is_russian_mobphone? mobphone
        puts "Некоректный моб. телефон!\nВведите заново: "
        mobphone = STDIN.gets.chomp
      end
      mobphone = Validator.to_valid_mobphone mobphone

      print 'Адрес: '
      address = STDIN.gets.chomp

      print 'Паспорт: '
      passport = STDIN.gets.chomp
      until Validator.is_passport? passport
        puts "Некоректный паспорт!\nВведите заново: "
        passport = STDIN.gets.chomp
      end
      passport = Validator.to_valid_passport passport

      print 'Категория: '
      category = STDIN.gets.chomp

      print 'Стаж вождения: '
      driverexp = STDIN.gets.chomp

      print 'Зарплата: '
      salary = STDIN.gets.chomp.to_i

      emp = Driver.new(fullname, birthdate, mobphone, address, passport, category, salary, driverexp)
      list_driver.add emp
    rescue ArgumentError => e
      puts e.message
      puts 'Введите данные заново!'
      add
    end

  end

  def find
    puts 'По какому полю вы хотите произвести поиск?'
    puts '1. По ФИО'
    puts '2. По паспорту'
    puts '3. По номеру телефона'
    print 'Выберите номер: '
    answer = STDIN.gets.chomp.to_i
    print 'Введите данные для поиска: '
    want_to_find = STDIN.gets.chomp

    case answer
    when 1
      puts list_driver.find(:fullname, want_to_find).nil? ? 'Такого водителя нет!' : list_driver.find(:fullname, want_to_find)
    when 2
      puts list_driver.find(:passport, want_to_find).nil? ? 'Такого водителя нет!' : list_driver.find(:passport, want_to_find)
    when 3
      puts list_driver.find(:mobphone, want_to_find).nil? ? 'Такого водителя нет!' : list_driver.find(:mobphone, want_to_find)
    end

  end

  def change
    puts 'Введите номер паспорта водителя, данные которого вы хотите изменить.'
    want_to_change = STDIN.gets.chomp

    driver = list_driver.find(:passport, want_to_change)
    if driver.nil?
      puts 'Такого водителя нет!'
    end
    puts 'Выберите, какие данные вы хотите изменить (можно список)'
    puts '1. ФИО'
    puts '2. Дата рождения'
    puts '3. Номер телефона'
    puts '4. Адрес'
    puts '5. Паспорт'
    puts '6. Категория'
    puts '7. Зарплата'
    puts '8. Стаж вождения'
    array_changes = STDIN.gets.chomp.split.map { |e| e.to_i }
    fields = { 1 => :fullname, 2 => :birthdate, 3 => :mobphone, 4 => :address, 5 => :passport,
               6 => :category, 7 => :salary, 8 => :driverexp }
    array_changes.each do |item|
      puts "Изменяется поле под номером: #{item}"
      print 'Введите новое значение: '
      change = STDIN.gets.chomp
      list_driver.change(driver, fields[item], change)
    end

  end

  def delete
    puts 'Введите номер паспорта водителя, данные которого вы хотите удалить из коллекции.'
    want_to_delete = STDIN.gets.chomp

    driver = list_driver.find(:passport, want_to_delete)
    if driver.nil?
      puts 'Такого водителя нет!'
    end
    list_driver.delete(driver)
  end

  def save
    list_driver.write_list
  end

  def close
    exit 0
  end

  def sort
    puts 'Выберите по какому полю нужно сортировать:'
    puts '1. ФИО'
    puts '2. Дата рождения'
    puts '3. Номер телефона'
    puts '4. Адрес'
    puts '5. Паспорт'
    puts '6. Категория'
    puts '7. Зарплата'
    puts '8. Стаж вождения'

    answer = STDIN.gets.chomp.to_i

    fields = { 1 => :fullname, 2 => :birthdate, 3 => :mobphone, 4 => :address, 5 => :passport,
               6 => :category, 7 => :salary, 8 => :driverexp }

    list_driver.sort(fields[answer])
  end

  def start

    until 1 != 1
      puts "\nМеню".center(20)
      puts '1. Добавление нового пользователя'
      puts '2. Отображение списка пользователей'
      puts '3. Нахождение пользователя по введенной строке'
      puts '4. Изменение конкретного пользователя'
      puts '5. Удаление конкретного пользователя'
      puts '6. Сохранение изменений в файл'
      puts '7. Сортировка данных'
      puts '8. Закрытие программы'
      print 'Введите номер команды: '
      number = STDIN.gets.chomp
      puts ''
      case number
      when '1'
        add
      when '2'
        show
      when '3'
        find
      when '4'
        change
      when '5'
        delete
      when '6'
        save
      when '7'
        sort
      when '8'
        close
      end
    end
  end

end

test = TerminalViewListDriver.new()

test.start()
        