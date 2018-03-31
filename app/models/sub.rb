class Sub < ApplicationRecord
  belongs_to :user

  def annual_cost
    if self.frequency = 'Monthly'
      ac = self.amount * 12
      puts ac
    end
  end
end
