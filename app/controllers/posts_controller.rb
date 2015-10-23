class PostsController < ApplicationController

  before_action :author_check, only: [:edit, :update, :destroy]

  def new
    @sub = Sub.find(params[:sub_id])
    @post = @sub.posts.new(author_id: current_user.id)
    render :new
  end

  def create
    @sub = Sub.find(params[:sub_id])
    @post = @sub.posts.new(post_params)
    @post.author_id = current_user.id

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
    @sub = @post.sub
    render :edit
  end

  def update
    @post = Post.find(params[:id])
    @sub = @post.sub
    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      render :edit
    end
  end


  private
    def post_params
      params.require(:post).permit(:title, :content, :url)
    end

    def author_check
      post = Post.find(params[:id])
      redirect_to post_url(post) unless post.author == current_user
    end

end