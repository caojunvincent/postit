class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
  # 1. set up instance variable for action
  # 2. redirect based on some condition

  def index
    @posts = Post.includes(:comments, :creator, :categories).order("id DESC")
  end

  def show
    @comment = Comment.new
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    binding.pry
    @post = Post.new(post_params)
    @post.creator = User.first # TODO: change once we have authentication

    if @post.save
      flash[:notice] = 'Your post was created'
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "The post was updated"
      redirect_to posts_path
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, 
                                 :url, 
                                 :description, 
                                 category_ids: [])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
