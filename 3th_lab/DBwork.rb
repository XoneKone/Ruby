require 'mysql2'
require_relative 'Employee'
require_relative 'Department'
require_relative 'Post'
require_relative 'Post_List'

# Singleton_class for working with database
class Database
  @@instance = nil

  attr_accessor :conn

  private_class_method :new

  def initialize
    self.conn = db_mysql_con
  end

  # @return Database instance
  def self.instance
    @@instance ||= new
  end

  # @return connection
  def db_mysql_con
    Mysql2::Client.new(host: '127.0.0.1', username: 'xonek', password: 'fylhjccb25', database: 'testDB')
  end

  # @return List[Employee]
  def read_DB_emp_list
    res = []
    conn.query('SELECT * FROM Employees').each do |r|
      res << Employee.new(r['EmployeeID'], r['fullname'], r['birthdate'], r['mobphone'],
                          r['address'], r['email'], r['passport'], r['specialization'], r['workexp'], r['prevnamework'],
                          r['post'], r['prevsalary'])
    end
    res
  end

  def read_DB_emp(emp_id)
    emp = nil
    conn.query("SELECT * FROM Employees WHERE EmployeeID = #{emp_id}").each do |r|
      emp = Employee.new(r['EmployeeID'], r['fullname'], r['birthdate'], r['mobphone'],
                         r['address'], r['email'], r['passport'], r['specialization'], r['workexp'], r['prevnamework'],
                         r['post'], r['prevsalary'])
    end
    emp
  end

  def read_DB_post_list_with_dep(dep_id)
    res = []
    conn.query("SELECT * FROM Posts WHERE DepartmentID = #{dep_id}").each do |r|
      res << Post.new(r['PostID'], r['PostName'], r['FixedSalary'].to_i, r['FixedPremiumBool'].to_i,
                      r['FixedPremiumSize'].to_i, r['QuarterlyAwardBool'].to_i, r['QuarterlyAwardSize'].to_i,
                      r['PossibleBonusBool'].to_i, r['PossibleBonusPercent'].to_i, r['EmployeeID'].to_i)
    end
    res
  end

  def read_DB_post_list_without_deb
    res = []
    conn.query('SELECT * FROM Posts WHERE EmployeeID = NULL').each do |r|
      res << Post.new(r['PostID'], r['PostName'], r['FixedSalary'], r['FixedPremiumBool'],
                      r['FixedPremiumSize'], r['QuarterlyAwardBool'], r['QuarterlyAwardSize'], r['PossibleBonusBool'],
                      r['PossibleBonusPercent'])
    end
    res
  end

  def read_DB_dep_list
    res = []
    conn.query('SELECT * FROM Departments').each do |r|
      res << Department.new(r['DepartmentID'], r['DepartmentName'],
                            PostList.new(WithDepStrategy.new, r['DepartmentID'].to_i))
    end
    res
  end

  def read_DB_dep(dep_id)
    dep = nil
    conn.query("SELECT * FROM Departments WHERE DepartmentID = #{dep_id}").each do |r|
      dep = Department.new(r['DepartmentID'], r['DepartmentName'])
    end
    dep
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
    conn.query("UPDATE Employees SET #{conn.escape(what_change)} = '#{conn.escape(change)}' WHERE EmployeeID = #{id}")
  end

  def delete_node(id)
    conn.query("DELETE FROM Employees WHERE EmployeeID = #{id}")
  end

  # closing the connection
  def close
    conn.close
  end
end

