class CreateLoans < ActiveRecord::Migration[5.1]
  def change
    create_table :loans, id: :uuid do |t|
      t.string :name
      t.string :description
      t.integer :lengthInMonths
      t.decimal :repayment
      t.integer :amount
      t.references :user, type: :uuid

      t.timestamps
    end
  end
end
