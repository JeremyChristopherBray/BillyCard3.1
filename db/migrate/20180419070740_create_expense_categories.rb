class CreateExpenseCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :expense_categories, id: :uuid do |t|
      t.string :name
      t.string :description
      t.references :expense, type: :uuid

      t.timestamps
    end
  end
end
