# adkit

Easy marketing calculations

## Conversion Rate

```ruby
total = 1_000
conversions = 15

Adkit.conversion_rate(total, conversions) # => 1.5

# or if you like acronyms
Adkit.cvr(total, conversions) # => 1.5
```

## Lift

```ruby
total = 1_000
conversions = 30

control = 100
control_conversions = 1

Adkit.lift(total, conversions, control, control_conversions) # => 200.0
```

## Cost Per Action

```ruby
cost = 9_876
conversions = 1_000

Adkit.cost_per_action(cost, conversions) # => 10.0

# or

Adkit.cpa(cost, conversions) # => 10.0
```

## Incremental Cost Per Action

```ruby
total = 5_000
cost = 100
conversions = 1_000
control = 100
control_conversions = 5

Adkit.incremental_cpa(total, cost, conversions, control, control_conversions) # => 0.1333333

# or

Adkit.cpia(total, cost, conversions, control, control_conversions) # => 0.1333333

# or

Adkit.icpa(total, cost, conversions, control, control_conversions) # => 0.1333333
```

## Average Order Value

```ruby
revenue = 123_456
conversions = 345

Adkit.average_order_value(revenue, conversions) # => 357.8434782608696

# or

Adkit.aov(revenue, conversions) # => 357.8434782608696
```

## Return on Ad Spend

```ruby
revenue = 12_345
cost = 987

Adkit.return_on_ad_spend(revenue, cost) # =>  1250.759878419453

# or
Adkit.roas(revenue, cost)
```
