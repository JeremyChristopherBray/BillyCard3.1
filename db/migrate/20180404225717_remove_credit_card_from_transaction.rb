class RemoveCreditCardFromTransaction < ActiveRecord::Migration[5.1]
  def change
    remove_reference :transactions, :credit_cards, foreign_key: true, type: :uuid
  end
end
