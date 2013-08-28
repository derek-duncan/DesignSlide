class ChangeAttachmentName < ActiveRecord::Migration
  def change
  	rename_table :attachments, :admin_attachments
  end
end
