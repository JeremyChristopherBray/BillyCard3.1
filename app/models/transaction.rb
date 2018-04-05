class Transaction < ApplicationRecord
  belongs_to :credit_card
  belongs_to :account
end
