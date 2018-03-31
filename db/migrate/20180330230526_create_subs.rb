class CreateSubs < ActiveRecord::Migration[5.1]
  def change
    create_table :subs, id: :uuid do |t|
      t.string :name
      t.string :description
      t.string :frequency
      t.decimal :amount
      t.string :frequency
      t.references :user, type: :uuid

      t.timestamps
    end
  end
end
