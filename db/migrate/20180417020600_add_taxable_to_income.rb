class AddTaxableToIncome < ActiveRecord::Migration[5.1]
  def change
    add_column :incomes, :taxable, :boolean, default: true
    remove_column :incomes, :taxed, :integer, default: 0
  end
end
