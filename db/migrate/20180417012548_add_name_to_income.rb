class AddNameToIncome < ActiveRecord::Migration[5.1]
  def change
    add_column :incomes, :name, :string
    add_column :incomes, :payer, :string
  end
end
