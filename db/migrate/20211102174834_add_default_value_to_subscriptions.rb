class AddDefaultValueToSubscriptions < ActiveRecord::Migration[6.1]
  def change
    change_column :subscriptions, :status, :integer, :default => 0
  end
end
