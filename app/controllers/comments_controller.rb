class CommentsController < ApplicationController
	before_action :require_user
	def create
		@post = Post.find(comment_params[:post_id])
	    @comment = Comment.new(comment_params)
	    @comment.post = @post
	    @comment.user = current_user
	    if @comment.save
			respond_to do |format|
	          format.js
	        end
		else
			redirect_to post_path(@post)
		end
	end

	private
	def comment_params
		params.require(:comment).permit(:content, :post_id)
	end

	
end