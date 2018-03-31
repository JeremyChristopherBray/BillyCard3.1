class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?


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

  def subs_total_monthly_payment

    n = current_user.subs.sum(&:amount)

    n
  end
  helper_method 'subs_total_monthly_payment'

  def payments_to_payoff
    balance / minimum_payment
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
