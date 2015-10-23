class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(post_id: params[:post_id])
    render :new
  end

  def create
    @comment = current_user.comments.new(comment_params)

    if @comment.save
      redirect_to post_url(params[:comment][:post_id])
    else
      render :new
    end
  end

  def show
    @comment = Comment.find(params[:id])
    render :show
  end

  private
    def comment_params
      params.require(:comment).permit(:post_id, :content, :parent_id)
    end

end
