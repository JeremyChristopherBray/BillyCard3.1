class AddDueDateToCreditCards < ActiveRecord::Migration[5.1]
  def change
    add_column :credit_cards, :dueDate, :date
  end
end
