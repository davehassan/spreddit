class PostsController < ApplicationController

  before_action :author_check, only: [:edit, :update, :destroy]

  def new
    @post = current_user.posts.new
    render :new
  end

  def create
    # @sub = Sub.find(params[:sub_id])
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to post_url(@post)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def edit
    @post = Post.find(params[:id])
    # @sub = @post.sub
    render :edit
  end

  def update
    @post = Post.find(params[:id])
    # @sub = @post.sub
    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      render :edit
    end
  end


  private
    def post_params
      params.require(:post).permit(:title, :content, :url, sub_ids: [])
    end

    def author_check
      post = Post.find(params[:id])
      redirect_to post_url(post) unless post.author == current_user
    end

end
