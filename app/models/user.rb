class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :accounts
  has_many :credit_cards
  has_many :subs
  has_many :expenses
  has_many :incomes
  has_many :loans
end
