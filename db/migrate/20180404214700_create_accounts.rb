class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts, id: :uuid do |t|
      t.string :name
      t.references :user, type: :uuid
      t.references :transactions, type: :uuid

      t.timestamps
    end
  end
end
