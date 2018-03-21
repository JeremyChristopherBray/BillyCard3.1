class CreateCreditCards < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_cards, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :nickName
      t.string :provider
      t.string :pointsProvidor
      t.decimal :interestRate
      t.decimal :balance
      t.decimal :limit
      t.references :user, type: :uuid

      t.timestamps
    end
  end
end
