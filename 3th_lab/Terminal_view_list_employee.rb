# frozen_string_literal: true

require_relative 'List_employee'
require_relative 'Validator'
require_relative 'testDB'

############################################################################################################
#                                                                                                          #
#                                     Class TerminalViewListEmployee                                       #
#                                                                                                          #
############################################################################################################

class TerminalViewListEmployee
  include Validator

  attr_accessor :list_employee
  attr_reader :connection

  def initialize
    connection = Database.new
    self.list_employee = ListEmployee.new(connection.conn)
  end

  def show
    puts list_employee.show
  end

  def add
    begin
      puts 'Введите данные работника:'

      print 'ФИО: '
      fullname = STDIN.gets.chomp
      unless Validator.is_fullname? fullname
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

      print 'E-mail: '
      email = STDIN.gets.chomp
      until Validator.is_email? email
        puts "Некоректный email!\nВведите заново: "
        email = STDIN.gets.chomp
      end
      email = Validator.to_valid_email email

      print 'Паспорт: '
      passport = STDIN.gets.chomp
      until Validator.is_passport? passport
        puts "Некоректный паспорт!\nВведите заново: "
        passport = STDIN.gets.chomp
      end
      passport = Validator.to_valid_passport passport

      print 'Специальность: '
      specialization = STDIN.gets.chomp

      print 'Стаж: '
      workexp = STDIN.gets.chomp.to_i

      print 'Название предыдущей работы: '
      prevnamework = STDIN.gets.chomp

      print 'Должность: '
      post = STDIN.gets.chomp

      print 'Предыдущая зарплата: '
      prevsalary = STDIN.gets.chomp.to_i

      emp = Employee.new(fullname, birthdate, mobphone, address, email, passport, specialization, workexp, prevnamework, post, prevsalary)
      list_employee.add emp
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
    puts '4. По email'
    print 'Выберите номер: '
    answer = STDIN.gets.chomp.to_i
    print 'Введите данные для поиска: '
    want_to_find = STDIN.gets.chomp

    case answer
    when 1
      puts list_employee.find(:fullname, want_to_find).nil? ? 'Такого водителя нет!' : list_employee.find(:fullname, want_to_find)
    when 2
      puts list_employee.find(:passport, want_to_find).nil? ? 'Такого водителя нет!' : list_employee.find(:passport, want_to_find)
    when 3
      puts list_employee.find(:mobphone, want_to_find).nil? ? 'Такого водителя нет!' : list_employee.find(:mobphone, want_to_find)
    when 4
      puts list_employee.find(:email, want_to_find).nil? ? 'Такого водителя нет!' : list_employee.find(:email, want_to_find)
    end

  end

  def change
    puts 'Введите номер работника, данные которого вы хотите изменить.'
    number = STDIN.gets.chomp.to_i
    if (number > list_employee.length) || number.negative?
      puts 'Такого работника нет!'
      exit 0
    end
    employee = list_employee.get_emp(number)

    puts 'Выберите, какие данные вы хотите изменить (можно список)'
    puts '1. ФИО'
    puts '2. Дата рождения'
    puts '3. Номер телефона'
    puts '4. Адрес'
    puts '5. Email'
    puts '6. Паспорт'
    puts '7. Специальность'
    puts '8. Стаж работы'
    puts '9. Предыдущее место работы'
    puts '10. Должность'
    puts '11. Зарплата'
    array_changes = STDIN.gets.chomp.split.map(&:to_i)
    fields = { 1 => :fullname, 2 => :birthdate, 3 => :mobphone, 4 => :address, 5 => :email, 6 => :passport,
               7 => :specialization, 8 => :workexp, 9 => :prevnamework, 10 => :post, 11 => :prevsalary }
    array_changes.each do |item|
      puts "Изменяется поле под номером #{item} ..."
      print 'Введите новое значение: '
      change = STDIN.gets.chomp
      list_employee.change(employee, fields[item], change)
    end

  end

  def delete
    puts 'Введите номер работника, данные которого вы хотите удалить.'
    number = STDIN.gets.chomp.to_i
    puts 'Такого работника нет!' if (number > list_employee.length) || number.negative?
    employee = list_employee.get_emp(number)
    list_employee.delete(employee)
  end

  def save
    list_employee.write_list
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
    puts '5. Email'
    puts '6. Паспорт'
    puts '7. Специальность'
    puts '8. Стаж работы'
    puts '9. Предыдущее место работы'
    puts '10. Должность'
    puts '11. Зарплата'
    answer = STDIN.gets.chomp.to_i

    fields = { 1 => :fullname, 2 => :birthdate, 3 => :mobphone, 4 => :address, 5 => :email, 6 => :passport,
               7 => :specialization, 8 => :workexp, 9 => :prevnamework, 10 => :post, 11 => :prevsalary }

    list_employee.sort(fields[answer])
  end

  def db_mysql_con
    client = Mysql2::Client.new(host: '127.0.0.1', username: 'xonek', password: 'fylhjccb25', database: 'testDB')
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

test = TerminalViewListEmployee.new

test.start
