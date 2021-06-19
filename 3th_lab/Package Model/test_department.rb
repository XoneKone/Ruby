# frozen_string_literal: true
require_relative '../Package Model/department'
require 'test/unit'

class TestDepartment < Test::Unit::TestCase
  def setup
    @dep = Department.new
  end

  def test_simple
    assert_equal(nil, @dep.id)
    assert_equal(nil, @dep.dep_name)
    assert_equal(nil, @dep.post_list)
  end

  def test_simple2
    tmp = Department.new.read_DB(1)
    @dep = @dep.read_DB(1)
    assert_equal(tmp.id, @dep.id)
    assert_equal(tmp.post_list, @dep.post_list)
    assert_equal(tmp.dep_name, @dep.dep_name)
  end

  def test_simple3
    assert_equal(['Бухгалтерия'], @dep.read_DB(1).data)
  end
end