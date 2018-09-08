class CreateSharedFolders < ActiveRecord::Migration[5.2]
  def change
    create_table :shared_folders do |t|
      t.integer :user_id
      t.string :shared_email
      t.integer :shared_user_id
      t.integer :holding_id
      t.string :message

      t.timestamps
    end
  end
end
