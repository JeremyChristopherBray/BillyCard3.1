class AddSuperannuationToIncome < ActiveRecord::Migration[5.1]
  def change
    add_column :incomes, :super, :boolean, default: true
  end
end
