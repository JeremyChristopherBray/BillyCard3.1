class PagesController < ApplicationController
  def home
  end

  def dashboard
    @total_monthly_income = total_monthly_income
    @total_monthly_expense = total_monthly_expenses
  end
end
