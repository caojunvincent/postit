class CommentsController < ApplicationController

  before_action :require_user, only: [:new, :create]#except: [:index, :show]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.creator = current_user #User.first # TODO: change once we have authentication

    if @comment.save
      flash[:notice] = "Your comment was added"
      redirect_to post_path(@post)
    else
      @comments = @post.comments.order("id DESC")
      render 'posts/show'
    end

  end

  private 

  def comment_params
    params.require(:comment).permit(:body)
  end

end
