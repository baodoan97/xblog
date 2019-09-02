class CommentsController < ApplicationController
	before_action :require_user
	def create
		@post = Post.find(params[:comment][:post_id])
	    @comment = Comment.new(comment_params)
	    @comment.post = @post
	    @comment.user = current_user
	    if @comment.save
			flash[:success] = "Comment was successfully created"
			# redirect_to post_path(@post)
			redirect_to post_path(@post)
		else
			redirect_to post_path(@post)
		end
	end

	private
	def comment_params
		params.require(:comment).permit(:content)
	end

	
end