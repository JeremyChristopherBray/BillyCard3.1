class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def minimum_payment
    n = balance / 100
    b = n * 1
    i = balance * interestRate
    c = i / 12

    c + b
  end
  helper_method 'minimum_payment'

  def total_monthly_payment

    n = current_user.credit_cards.sum(minimum_payment)

    n
  end
  helper_method 'total_monthly_payment'


end
