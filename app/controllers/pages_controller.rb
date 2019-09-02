class PagesController < ApplicationController
	def index
		@posts = Post.limit(3).order('id desc')
	end
end