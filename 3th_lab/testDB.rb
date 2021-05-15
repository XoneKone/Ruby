require 'mysql2'
require_relative 'Employee'

# Singleton_class for working with database
class Database
  @@instance = nil

  attr_accessor :conn

  private_class_method :new

  def initialize
    self.conn = db_mysql_con
  end

  def self.instance
    @@instance ||= new
  end

  def db_mysql_con
    Mysql2::Client.new(host: '127.0.0.1', username: 'xonek', password: 'fylhjccb25', database: 'testDB')
  end

  def select_all
    res = []
    conn.query('SELECT * FROM Employees').each do |r|
      res << Employee.new(r['EmployeeID'], r['fullname'], r['birthdate'], r['mobphone'],
                          r['address'], r['email'], r['passport'], r['specialization'], r['workexp'], r['prevnamework'],
                          r['post'], r['prevsalary'])
    end
    res
  end

  def add_node(data)
    escaped = data.map do |value|
      "'#{conn.escape(value)}'"
    end
    p escaped.join(',')
    conn.query("INSERT INTO Employees (fullname,birthdate,mobphone,address,email,passport,specialization,
workexp, prevnamework, post, prevsalary) VALUES (#{escaped.join(',')});")
  end

  def change_node(id, what_change, change)
    conn.query("UPDATE Employees SET #{conn.escape(what_change)} = #{conn.escape(change)} WHERE EmployeeID = #{id}")
  end

  def delete_node(id)
    conn.query("DELETE FROM Employees WHERE EmployeeID = #{id}")
  end

  def close
    conn.close
  end
end

a = Database.instance
p a.select_all
a.add_node(['Горин Геннадий Геннадьевич',
            '05.05.1987',
            '8-905-9823214',
            'ул. Северная, д. 35',
            'gena@mail.ru',
            '02 01 846975',
            'Программист',
            '5',
            'Магнит',
            'Senior-программист',
            '150000'])

p   a.select_all