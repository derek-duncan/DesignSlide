class PostsandComments < ActiveRecord::Migration
  def up
	  create_table :admin_posts do |t|
	  	t.string :title, :null => false
	  	t.string :author, :null => false
	  	t.text :content, :null => false
	  	t.string :attachments
	    t.timestamps
	  end
	  create_table :comments do |t|
	  	t.string :name, :null => false
	  	t.string :content, :null => false
	    t.timestamps
	  end
  end

  def down
  	drop_table :admin_posts
  	drop_table :comments
  end
end
