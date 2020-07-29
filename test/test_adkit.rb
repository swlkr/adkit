require 'minitest/autorun'
require 'adkit'

class AdkitTest < Minitest::Test
  def test_conversion_rate
    total = 1_000
    conversions = 15

    assert_equal 1.5, Adkit.conversion_rate(total, conversions)
    assert_equal 1.5, Adkit.cvr(total, conversions)
  end

  def test_conversion_rate_nil
    assert_raises(NoMethodError) { Adkit.conversion_rate(nil, nil) }
  end

  def test_lift
    total = 1_000
    conversions = 30

    control = 100
    control_conversions = 1

    assert_equal 200.0, Adkit.lift(total, conversions, control, control_conversions)
  end

  def test_cost_per_action
    cost = 9_876
    conversions = 123

    assert_equal 80.29268292682927, Adkit.cost_per_action(cost, conversions)
    assert_equal 80.29268292682927, Adkit.cpa(cost, conversions)
  end

  def test_incremental_cost_per_action
    total = 5_000
    cost = 100
    conversions = 1_000
    control = 100
    control_conversions = 5

    assert_equal 0.13333333333333333, Adkit.incremental_cpa(total, cost, conversions, control, control_conversions)
    assert_equal 0.13333333333333333, Adkit.cpia(total, cost, conversions, control, control_conversions)
    assert_equal 0.13333333333333333, Adkit.icpa(total, cost, conversions, control, control_conversions)
  end

  def test_aov
    revenue = 123_456
    conversions = 345

    assert_equal 357.8434782608696, Adkit.average_order_value(revenue, conversions)
    assert_equal 357.8434782608696, Adkit.aov(revenue, conversions)
  end

  def test_roas
    revenue = 12_345
    cost = 987

    assert_equal 1250.759878419453, Adkit.return_on_ad_spend(revenue, cost)
    assert_equal 1250.759878419453, Adkit.roas(revenue, cost)
  end
end
