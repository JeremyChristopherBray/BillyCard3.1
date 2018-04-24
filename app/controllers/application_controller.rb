class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def monthly_active_subs
    current_user.subs.where(archive: false).sum(:amount)
  end
  helper_method 'monthly_active_subs'

  def monthly_archived_subs
    current_user.subs.where(archive: true).sum(:amount)
  end
  helper_method 'monthly_archived_subs'

  def annual_income_minus_tax
    current_user.incomes.sum(&:annual_after_tax_income)
  end
  helper_method 'annual_income_minus_tax'

  def annual_subs
    monthly_subs * 12
  end

  def weekly_subs
    monthly_subs / 4
  end

  def total_monthly_expenses
    n = current_user.expenses.sum(:amount) + monthly_subs + total_monthly_payment
    n
  end
  helper_method 'total_monthly_expenses'

  def total_weekly_expenses
    i = current_user.expenses.sum(:amount)
    p = i / 4
    n = p + weekly_subs + weekly_cc_payment
    n
  end
  helper_method 'total_weekly_expenses'

  def total_annual_expenses
    i = current_user.expenses.sum(:amount)
    p = i * 12
    n = p + annual_subs + annual_cc_payment
    n
  end
  helper_method 'total_annual_expenses'

  def minimum_payment
    n = balance / 100
    b = n * 1
    i = balance * interestRate
    c = i / 12
    c + b
  end
  helper_method 'minimum_payment'

  def total_monthly_payment
    n = current_user.credit_cards.sum(&:minimum_payment)
    n
  end
  helper_method 'total_monthly_payment'

  def weekly_cc_payment
    total_monthly_payment / 4
  end

  def annual_cc_payment
    total_monthly_payment * 12
  end

  def subs_total_monthly_payment
    n = current_user.subs.sum(&:amount)
    n
  end
  helper_method 'subs_total_monthly_payment'

  def payments_to_payoff
    current_user.credit_cards.balance / current_user.credit_cards.minimum_payment
  end

  helper_method 'payments_to_payoff'

  def initials
    current_user.firstName.chars.first + current_user.lastName.chars.first
  end

  helper_method 'payments_to_payoff'

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstName, :lastName])
    devise_parameter_sanitizer.permit(:account_update, keys: [:firstName, :lastName])
  end
end
