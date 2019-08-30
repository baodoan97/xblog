class PostsController < ApplicationController
	before_action :set_post, only: [:edit, :update, :show, :destroy]
	before_action :require_user, except: [:index, :show]
	# before_action :require_same_user, only: [:edit, :update, :destroy]
	def new
		@post = Post.new
	end

	def index
		# @post = Post.paginate(page: params[:page], per_page: 5)
	end

	def create
		@post = Post.new(post_params)
		# @post.user = current_user
		if @post.save
			flash[:success] = "Post was successfully created"
			# redirect_to post_path(@post)
			redirect_to root_path
		else
			render 'new'
		end
	end

	def show
		
	end	

	def edit
		
	end

	def update
		if @post.update(post_params)
			flash[:success] = "Post was successfully updated"
			redirect_to post_path(@post)
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		flash[:success] = "Post was successfully deletedd"
		redirect_to posts_path
	end

	private
		def set_post
			@post = Post.find(params[:id])
		end

		def post_params
			params.require(:post).permit(:title, :content)
		end

		# def require_same_user
		# 	if current_user != @post.user && current_user.admin?
		# 		flash[:danger] = "You can only edit or delete your own posts"
		# 		redirect_to root_path
		# 	end
		# end

end