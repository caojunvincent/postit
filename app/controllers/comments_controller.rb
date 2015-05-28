class CommentsController < ApplicationController

  before_action :require_user #, only: [:new, :create, :vote]#except: [:index, :show]

  def create
    @post = Post.find_by(slug: params[:post_id])
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

  def vote
    comment = Comment.find(params[:id])
    @vote = Vote.create(voteable: comment,
                       creator: current_user,
                       vote: params[:vote])
    if @vote.valid?
      flash[:notice] = "Your vote was counted."
    else
      flash[:error] = "You can only vote for that comment once"
    end

    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
