class AddPostIdToAttachements < ActiveRecord::Migration
  def change
  	add_column :attachments, :post_id, :integer
  end
end
