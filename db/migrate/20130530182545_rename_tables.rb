class RenameTables < ActiveRecord::Migration
  def change
  	rename_table :admin_posts, :posts
  	rename_table :admin_attachments, :attachments
  end
end
