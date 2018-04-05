class AddColumnsToTransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :transactionDate, :date
    add_column :transactions, :transactionAmount, :decimal
    add_column :transactions, :transactionDescription, :string
  end
end
