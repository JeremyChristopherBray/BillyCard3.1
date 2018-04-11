class CreateIncomes < ActiveRecord::Migration[5.1]
  def change
    create_table :incomes, id: :uuid do |t|
      t.decimal :amount
      t.integer :frequency

      t.timestamps
    end
  end
end
