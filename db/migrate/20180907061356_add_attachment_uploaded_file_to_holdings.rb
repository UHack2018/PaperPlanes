class AddAttachmentUploadedFileToHoldings < ActiveRecord::Migration[5.2]
  def self.up
    change_table :holdings do |t|
      t.attachment :uploaded_file
    end
  end

  def self.down
    remove_attachment :holdings, :uploaded_file
  end
end
