require_relative '../Package Model/department_list'
require 'test/unit'

class TestDeparmentList < Test::Unit::TestCase
  def setup
    @dep_list = DepartmentList.new
  end

  def test_simple
    assert_not_nil(@dep_list.department_list)
    assert_not_nil(@dep_list.facade)
  end

  def test_simple2
    assert_nothing_raised(Mysql2::Error) { @dep_list.read_DB }
  end

  def test_simple3
    assert_equal(6, @dep_list.get_last_id)
  end

  def test_simple4
    dep = @dep_list.department_list[0]
    assert_nothing_raised(Mysql2::Error) { @dep_list.change(dep, 'dep_name', 'Бугхелтеры') }
    assert_equal('Бугхелтеры', dep.dep_name)
  end

  def test_simple5
    dep = Department.new(@dep_list.get_last_id, 'R')
    assert_nothing_raised(Mysql2::Error) { @dep_list.add(dep) }
    dep2 = @dep_list.department_list[-1]
    assert_equal(dep, dep2)
  end

  def test_simple7
    dep2 = @dep_list.department_list[-2]
    len = @dep_list.department_list.length
    assert_nothing_raised(Mysql2::Error) { @dep_list.delete(dep2) }
    len2 = @dep_list.department_list.length
    assert_equal(len - 1, len2)
  end

  def test_simple8
    assert_nothing_raised(Exception){@dep_list.serialize}
  end

  def test_simple9
    assert_not_nil(@dep_list.deserialize,'No error')
  end

end