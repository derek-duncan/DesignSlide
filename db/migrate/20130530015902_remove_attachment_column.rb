class RemoveAttachmentColumn < ActiveRecord::Migration
  def up
  	remove_column :admin_posts, :attachments
  end

  def down
  	add_column :admin_posts, :attachments, :string
  end
end
