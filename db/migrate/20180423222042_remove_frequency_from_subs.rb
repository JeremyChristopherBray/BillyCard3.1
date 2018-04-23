class RemoveFrequencyFromSubs < ActiveRecord::Migration[5.1]
  def change
    remove_column :subs, :frequency, :string
  end
end
