class PostsController < ApplicationController
	def index
		@posts = Post.all
	end
	def show
		@post = Post.find(params[:id])
	end
	def new
		@post = Post.new
	end
	def create
		@post = Post.create(post_params)
		if @post.save
			redirect_to admin_posts_path, notice: "create successfully"
		else
			render :new
		end
	end
	def edit
		@post = Post.find(params[:id])
	end
	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			redirect_to admin_posts_path, notice: "update successfully"
		else
			render :edit
		end
	end
	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to admin_posts_path, alert: "delete successfully"
	end
	private
	def post_params
		params.require(:post).permit(:title, :content)
	end
end
