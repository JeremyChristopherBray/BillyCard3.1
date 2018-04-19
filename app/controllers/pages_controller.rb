class PagesController < ApplicationController
  def home
  end

  def dashboard
    @weekly_income = annual_income_minus_tax / 52
    @fornightly_income = annual_income_minus_tax / 26
    @monthly_income = annual_income_minus_tax / 12
    @annual_income = annual_income_minus_tax
    @weekly_expenses = total_monthly_expenses / 4
    @fortnightly_expenses = total_monthly_expenses / 2
    @monthly_expenses = total_monthly_expenses
    @annual_expenses = total_monthly_expenses * 12
    @total_monthly_expense = total_monthly_expenses
    @weekly_leftovers = @weekly_income - @weekly_expenses
    @monthly_leftovers = @monthly_income - @total_monthly_expense
    @annual_leftovers = @annual_income - @annual_expenses
  end
end
