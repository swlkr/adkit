module Adkit
  VERSION = '0.1.0'.freeze

  class << self
    def cvr(total, conversions)
      if total.zero?
        0.0
      else
        100.0 * conversions / total.to_f
      end
    end

    alias conversion_rate cvr

    def lift(total, conversions, control, control_conversions)
      real_cvr = cvr(total, conversions)
      control_cvr = cvr(control, control_conversions)

      if control_cvr.zero?
        0.0
      else
        100.0 * (real_cvr - control_cvr) / control_cvr
      end
    end

    def cpa(cost, conversions)
      if conversions.zero?
        0.0
      else
        cost / conversions.to_f
      end
    end

    alias cost_per_action cpa

    def incremental_cpa(total, cost, conversions, control, control_conversions)
      if control.zero?
        0.0
      else
        cpa(cost.to_f, conversions.to_f - (control_conversions.to_f * (total.to_f / control)))
      end
    end

    alias cpia incremental_cpa
    alias icpa incremental_cpa

    def aov(revenue, conversions)
      if conversions.zero?
        0.0
      else
        revenue / conversions.to_f
      end
    end

    alias average_order_value aov

    def roas(revenue, cost)
      if cost.zero?
        0.0
      else
        100.0 * revenue / cost.to_f
      end
    end

    alias return_on_ad_spend roas
  end
end
