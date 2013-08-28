class Attachment < ActiveRecord::Base
  attr_accessible :path, :description, :post_id
  belongs_to :post
  mount_uploader :path, PostUploader
end
