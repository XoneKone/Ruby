require_relative 'Driver'

############################################################################################################
#                                                                                                          #
#                                       Class ListDriver                                                 #
#                                                                                                          #
############################################################################################################

class ListDriver

  attr_accessor :driver_list

  def initialize(path)
    self.driver_list = []
    read_list path
  end

  def read_list path
    data = IO.read(path).split("\n\n")
    data.each do |dr|
      fields = dr.split("\n")
      driver = Driver.new(*fields)
      add driver
    end

  end

  def add(driver)
    driver_list.push(driver)
  end

  def change(driver, what_change, change)
    driver.send("#{what_change}=", change)
  end

  def delete(driver)
    driver_list.delete(driver)
  end

  def write_list
    str = ''
    File.open('storage.txt', 'w') { |file|
      driver_list.each do |driver|
        str += driver.to_s
      end
      file.write str.chomp.chomp
    }
  end

  def find(key, string)
    driver_list.each do |dr|
      return dr if dr.send(key) == string
    end
    nil
  end

  def show
    data = ''
    ind = 1
    driver_list.each do |dr|
      data += "Водитель №#{ind}\n" \
              "ФИО: #{dr.fullname}\n" \
              "Дата рождения: #{dr.birthdate}\n" \
              "Номер телефона: #{dr.mobphone}\n" \
              "Адрес: #{dr.address}\n" \
              "Паспорт: #{dr.passport}\n" \
              "Категория: #{dr.category}\n" \
              "Зарплата: #{dr.salary}\n" \
              "Стаж вождения: #{dr.driverexp}\n\n"
      ind += 1
    end
    data
  end

  def sort(key)
    driver_list.sort_by! { |driver| driver.send(key) }
  end

  def each(&block)
    @driver_list.each(&block)
  end

end
