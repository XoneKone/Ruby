# frozen_string_literal: true
require_relative 'DBwork'

# Класс, отвечающий за работу с Отделом
class Department
  attr_accessor :post_list, :dep_name, :id

  # Сеттер для списка должностей
  # Если он есть, то выдается обратная ссылка
  # @param [PostList] post_list
  def post_list=(post_list)
    @post_list = post_list
    @post_list.department = self unless post_list.nil?
  end

  # @param [Integer] dep_id
  # @param [String] dep_name
  # @param [PostList] post_list
  def initialize(dep_id = nil, dep_name = nil, post_list = nil)
    @id = dep_id
    @dep_name = dep_name
    self.post_list = post_list
  end

  # Считывание данных из базы данных
  # @param [Integer] dep_id
  # @return [Department] если получилось
  # @return [NilClass] если нет
  def read_DB(dep_id)
    Database.instance.read_DB_dep(dep_id)
  end

  # Изменение данных в базе данных
  def change
    Database.instance.change_node({ 'table' => 'Departments', 'what_change' => 'DepartmentName', 'change' => dep_name,
                                    'field' => 'DepartmentID', 'id' => id })
  end

  # Метод реализующий правильное отображение данных для вставки в базу данных
  # @return [Array<attributes>] attributes - это атрибуты класса
  def data
    [dep_name]
  end

  # Переопределение метода to_s
  # @return [String]
  # @example №1 Бухгалтерия
  def to_s
    "№#{id} #{dep_name}"
  end
end
