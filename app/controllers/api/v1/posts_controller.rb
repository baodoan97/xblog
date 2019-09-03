class Api::V1::PostsController < ApplicationController
  before_action :load_post, only: [:show]

  def index
    @posts = Post.order('created_at DESC')
    render json: {
      status: true,
      data: @posts
    }, 
    status: :ok
  end

  def show
    render json: {
      status: true,
      data: @post
    }, 
    status: :ok
  end

  private
  def load_post
    @post = Post.find_by id: params[:id]
    return if @post
    render json: {
      status: false,
      message: 'Not found'
    }, 
    status: :not_found
  end
end