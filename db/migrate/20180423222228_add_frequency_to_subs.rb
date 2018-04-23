class AddFrequencyToSubs < ActiveRecord::Migration[5.1]
  def change
    add_column :subs, :frequency, :integer, default: 0
  end
end
