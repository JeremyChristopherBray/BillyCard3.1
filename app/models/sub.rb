class Sub < ApplicationRecord
  belongs_to :user

  def annual_cost
    amount * 12
  end

  def total_annual_cost
    annual_cost.sum
  end
end
