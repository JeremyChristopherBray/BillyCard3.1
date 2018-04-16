class PagesController < ApplicationController
  def home
  end

  def dashboard
    @income = annual_income_minus_tax / 12
    @expenses = current_user.expenses.all
    @total_monthly_expense = total_monthly_expenses
    @monthly_leftovers = @income - @total_monthly_expense
  end
end
