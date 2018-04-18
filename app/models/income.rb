class Income < ApplicationRecord
  enum incomeType: {income: 0, allowance: 1 }
  enum taxed: {yes: 0, no: 1 }

  belongs_to :user

  def annual_income
    amount * frequency
  end
  def monthly_income
    annual_income / 12
  end
  def fortnightly_income
    annual_income / 26
  end
  def weekly_income
    annual_income / 52
  end
  def tax
    if self.taxable?
      tax = annual_income
      case tax
      when 0 .. 18200
        0
      when 18201 .. 37000
        i = annual_income - 18200
        0.19 * i
      when 37001 .. 87000
        i = annual_income - 37000
        p = 0.325 * i
        3572 + p
        puts 2
      when 87001 .. 180000
        i = annual_income - 87000
        p = 0.37 * i
        19822 + p
      else
        i = annual_income - 180000
        p = 0.45 * i
        54232 + p
      end
    else
      0
    end
  end

  def annual_after_tax_income
    annual_income - tax
  end

  def monthly_tax
    tax / 12
  end

  def fortnightly_tax
    tax / 26
  end

  def weekly_tax
    tax / 52
  end

  def monthly_income_after_tax
    monthly_income - monthly_tax
  end

  def fortnightly_income_after_tax
    fortnightly_income - fortnightly_tax
  end

  def weekly__income_after_tax
    weekly_income - weekly_tax
  end

  def superannuation
    if self.super?
      annual_income * 0.09
    end

  end

end
