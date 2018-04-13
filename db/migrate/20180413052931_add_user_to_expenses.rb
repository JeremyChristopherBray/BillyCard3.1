class AddUserToExpenses < ActiveRecord::Migration[5.1]
  def change
    add_reference :expenses, :user, type: :uuid
    add_reference :incomes, :user, type: :uuid
    add_column :expenses, :frequency, :integer
  end
end
