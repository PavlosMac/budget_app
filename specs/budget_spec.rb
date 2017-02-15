require('minitest/autorun')
require('minitest/rg')
require_relative('../models/budget')

class TestBudget < MiniTest::Test

  def setup
      options = { 'id' => 5, 'category_id' => 3,
              'value' => 20.00
              }

    @budget = Budget.new(options)

  end

  def test_budget_has_id
    assert_equal(5, @budget.id)
  end

  def test_budget_has_value
    assert_equal(20.00, @budget.value)
  end

  def test_budget_has_category_id
    assert_equal(3, @budget.category_id)
  end

end
