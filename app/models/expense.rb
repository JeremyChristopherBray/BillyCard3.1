class Expense < ApplicationRecord
  belongs_to :user

  def annual_expense
    self.amount * self.frequency
  end
  def monthly_expense
    annual_expense / 12
  end
  def weekly_expense
    annual_expense / 52
  end
  def daily_expense
    annual_expense / 365
  end
end
