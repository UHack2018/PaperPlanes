class AddUserIdToHoldings < ActiveRecord::Migration[5.2]
  def change
    add_column :holdings, :user_id, :integer
  end
end
