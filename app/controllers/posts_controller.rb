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
	 # @post = Post.new(params["post"])
	  #@post = Post.new(params.require(:post).permit(:title, :description))
	  #@post = Post.new(post_params)
	  @post = Post.new(post_params(:title, :description))
	  @post.save
	  redirect_to post_path(@post)
	end

	def update
	  @post = Post.find(params[:id])
	  #@post.update(params["post"])
	  #@post.update(params.require(:post).permit(:title, :description))
	  #@post.update(post_params)
	  @post.update(post_params(:title))
	  redirect_to post_path(@post)
	end

	def edit
	  @post = Post.find(params[:id])
	end

	private

	def post_params(*args)
	#This is a very helpful method since if you duplicated the strong parameter call in both the create and update methods you would need to change both method arguments every time you change the database schema for the posts table... and that sounds like a bad way to live. However, by creating this post_params method we can simply make one change and both methods will automatically be able to have the proper attributes whitelisted
	#params.require(:post).permit(:title, :description)
	params.require(:post).permit(*args)
	end
end
