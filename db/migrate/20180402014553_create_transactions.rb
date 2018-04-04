class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions, id: :uuid do |t|
      t.datetime :date
      t.decimal :amount
      t.references :credit_card, type: :uuid

      t.timestamps
    end
  end
end
