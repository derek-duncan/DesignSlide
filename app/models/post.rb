class Post < ActiveRecord::Base
  attr_accessible :title, :content, :author
  has_many :attachments, :dependent => :destroy
  accepts_nested_attributes_for :attachments
  # mount_uploader :path, PostUploader
end
