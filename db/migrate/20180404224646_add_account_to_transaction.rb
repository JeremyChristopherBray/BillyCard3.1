class AddAccountToTransaction < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :references, :account
    remove_column :transactions, :references, :credit_card
  end
end
