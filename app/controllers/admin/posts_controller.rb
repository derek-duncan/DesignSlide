class Admin::PostsController < ApplicationController
	layout 'admin'
	def index
		@posts = Post.all
	end
	def show
		@post = Post.find(params[:id])
		@attach = @post.attachments.find_all_by_post_id(params[:id])
	end
	def new
		@post = Post.new
	end
	def create
		@post = Post.new(params[:post])
		if @post.save
	  	respond_to do |format|
		    format.html { redirect_to new_admin_post_attachment_path(@post) }
		    format.js   { }
	  	end
		else
			flash[:notice] = "Did not create post because of errors"
			redirect_to admin_posts_path
		end
	end
	def edit
		@post = Post.find(params[:id])
		@attach = @post.attachments.find_all_by_post_id(params[:id])
	end
	def update
		@post = Post.find(params[:id])
		@post.update_attributes(params[:post])
		redirect_to [:admin, @post]
	end
	def destroy
		@post = Post.find(params[:id])
		FileUtils.remove_dir("#{Rails.root}/public/uploads/attachment/path/#{@post.id}", :force => true)
		@post.destroy
		redirect_to admin_posts_path
	end
	def updatePost
		@post = Post.find(84)
		@post.update_attributes(params[:post])
		redirect_to [:admin, @post]
	end
end
