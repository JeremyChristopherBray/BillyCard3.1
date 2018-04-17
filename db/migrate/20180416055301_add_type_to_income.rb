class AddTypeToIncome < ActiveRecord::Migration[5.1]
  def change
    add_column :incomes, :incomeType, :integer, default: 0
    add_column :incomes, :country, :integer, default: 0
    add_column :incomes, :taxed, :integer, default: 0
  end
end
