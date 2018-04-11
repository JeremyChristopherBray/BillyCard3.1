class Income < ApplicationRecord
  def annual_income
    self.amount * self.frequency
  end
  def monthly_income
    annual_income / 12
  end
  def weekly_income
    annual_income / 52
  end
  def tax
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
    when 87001 .. 180000
      i = annual_income - 87000
      p = 0.37 * i
      19822 + p
    else
      i = annual_income - 180000
      p = 0.45 * i
      54232 + p
    end
  end

  def annual_after_tax_income
    annual_income - tax
  end

  def monthly_tax
    tax / 12
  end

  def weekly_tax
    tax / 52
  end

  def monthly_income_after_tax
    monthly_income - monthly_tax
  end
  def weekly__income_after_tax
    weekly_income - weekly_tax
  end

  def superannuation
    annual_income * 0.09
  end
end
