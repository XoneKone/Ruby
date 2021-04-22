require 'mysql2'
require 'date'
require_relative 'Employee'

def db_mysql_con
  client = Mysql2::Client.new(host: '127.0.0.1', username: 'xonek', password: 'fylhjccb25', database: 'testDB')
end

def db_select_log(conn)
  res = []
  conn.query('SELECT * FROM Employees').each do |r|
    res << Employee.new(r["EmployeeID"], r["fullname"], r["birthdate"].strftime('%d.%m.%Y'), r["mobphone"], r["address"], r["email"], r["passport"], r["specialization"], r["workexp"], r["prevnamework"], r["post"], r["prevsalary"])
  end
  res
end

conn_mysql = db_mysql_con
puts db_select_log(conn_mysql)
conn_mysql.close
