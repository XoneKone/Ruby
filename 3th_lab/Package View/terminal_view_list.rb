# frozen_string_literal: true
#
class TerminalViewList
  attr_accessor :controller

  def show
    until 1 != 1
      puts "\nМеню".center(20)
      puts '1. Добавить новый элемент'
      puts '2. Отобразить список'
      puts '3. Выбрать элемент'
      puts '4. Изменить выбранное'
      puts '5. Удалить выбранное'
      puts '6. Сохранить'
      puts '7. Закрыть список'
      print 'Введите номер команды: '
      number = STDIN.gets.chomp
      puts ''
      case number
      when '1'
        add
      when '2'
        show_list
      when '3'
        choose
      when '4'
        change
      when '5'
        del
      when '6'
        save
      when '7'
        close
      else
        puts '\nНет такого номера!\n'
      end
    end
  end

  def add
    @controller.add
  end

  def show_list
    @controller.show_list
  end

  def choose
    @controller.choose
  end

  def change
    @controller.change
  end

  def del
    @controller.del
  end

  def save
    @controller.save
  end

  def close
    @controller.close_view
  end
end