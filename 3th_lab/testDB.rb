require 'mysql2'
require_relative 'Employee'

class Database
  attr_accessor :conn

  def initialize
    self.conn = db_mysql_con
  end

  def db_mysql_con
    Mysql2::Client.new(host: '127.0.0.1', username: 'xonek', password: 'fylhjccb25', database: 'testDB')
  end

  def test_select
    res = []
    conn.query('SELECT * FROM Employees').each do |r|
      res << Employee.new(r['EmployeeID'], r['fullname'], r['birthdate'].strftime('%d.%m.%Y'), r['mobphone'],
                          r['address'], r['email'], r['passport'], r['specialization'], r['workexp'], r['prevnamework'],
                          r['post'], r['prevsalary'])
    end
    res
  end

  def close
    conn.close
  end

end

