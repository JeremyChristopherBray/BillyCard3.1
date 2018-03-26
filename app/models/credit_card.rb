class CreditCard < ApplicationRecord
  belongs_to :user
  def credit_available
    limit - balance
  end

  def annual_interest
    if self.balance && self.interestRate
      self.balance * self.interestRate
    else
      "0.0".to_d
    end
  end


  def minimum_payment
    n = balance / 100
    b = n * 1
    i = balance * interestRate
    c = i / 12

    c + b
  end

  def total_monthly_payment
    minimum_payment
  end

end

