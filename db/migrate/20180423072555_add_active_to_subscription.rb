class AddActiveToSubscription < ActiveRecord::Migration[5.1]
  def change
    add_column :subs, :archive, :boolean, null: false, default: false
  end
end
