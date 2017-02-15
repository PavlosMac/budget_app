require_relative('../db/sql_runner')
require('pry-byebug')
require('pg')

class Budget

attr_reader :id, :value, :category_id

  def initialize( options )
    @id = options['id'].to_i
    @value = options['value'].to_f
    @category_id = options['category_id'].to_i
  end

  def save
  sql = "INSERT INTO budgets (value, category_id) VALUES (#{@value}, #{@category_id}) RETURNING *"
    data = SqlRunner.run(sql).first
    @id = data['id']
  end

  def category
    sql = "SELECT * FROM categories WHERE id = #{@category_id}"
    data = Category.map_item(sql)
    return data
  end

  def total_spent
      sql = "SELECT SUM(currency) FROM transactions WHERE category_id = #{@category_id}"
      res = SqlRunner.run(sql).first
      return res["sum"]
  end


  def self.update(data)
    sql = "UPDATE budgets SET value = #{data['currency']} WHERE id = #{data['id']}"
    SqlRunner.run(sql)
  end

  def self.total
    sql = "SELECT SUM(value) FROM budgets"
    response = SqlRunner.run(sql).first
    return response["sum"]
  end

  def self.all
    sql = "SELECT * FROM budgets"
    data = Budget.map_items(sql)
    return data
  end


  def self.map_item(sql)
    data = Budget.map_items(sql)
    return data.first
  end


  def self.delete(id)
    sql = "DELETE FROM budgets WHERE id = #{id}"
    SqlRunner.run(sql)
  end


  def self.delete_all
    sql = "DELETE FROM budgets"
    SqlRunner.run(sql)
  end


  def self.find(id)
    sql = "SELECT * FROM budgets WHERE id = #{id}"
    return Budget.map_item(sql)
  end


  def self.map_items(sql)
    data = SqlRunner.run(sql)
    array = data.map{ |budget| Budget.new(budget) }
    return array
  end

end
