class CreditCard < ApplicationRecord
  belongs_to :user
  has_many :payments


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

  def payments_to_payoff
    r = interestRate / 12
    s = balance
    d = minimum_payment
    rs = r * s
    n = -(Math.log(rs/d)/Math.log(1 + r))

    n
  end


end

