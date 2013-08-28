class Admin::AttachmentsController < ApplicationController
  def index
  end

  def new
  	@post = Post.find(params[:post_id])
  	@attachment = @post.attachments.new
  	@attachs = @post.attachments.find_all_by_post_id(params[:post_id]).reverse
  	@attach = @post.attachments.order("created_at").last
    @all = @post.attachments.find(:all)
  end

  def create
  	@post = Post.find(params[:post_id])
    @all = @post.attachments.find(:all)
  	# @attachment = @post.attachments.new(params[:admin_attachment])
		params[:attachment][:path].each do |image|
			@params = {}
			@params['path'] = image
			@attachment = @post.attachments.create(@params)
		end
		if @attachment.save
      @attachs = @post.attachments.find_all_by_post_id(params[:post_id]).reverse
      @attach = @post.attachments.order("created_at").last
      respond_to do |format|
        format.js {render "create", :locals => {:attach => @attachs}}
      end
		end
  end

  def show
  end

  def destroy
  	@post = Post.find(params[:post_id])
  	@attachment = @post.attachments.find_by_post_id(params[:post_id])
  	# FileUtils.remove_dir("#{Rails.root}/public/uploads/attachment/path/#{@post.id}/#{@attachment.id}", :force => true)
  	@attachment.destroy
  	redirect_to :back
  end
end
