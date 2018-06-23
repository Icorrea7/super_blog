class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all
    @post = Post.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = "Tu Post ha sido creado"
      redirect_to root_path
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  def show
    @comment = @post.comments.new
  end
  def edit

  end
  def update
    @post.update_attributes(post_params)
    if @post.save
      flash[:success] = "Tu Post ha sido creado"
      redirect_to post_path(@post.id)
    end
  end


  private
  def post_params
    params.require(:post).permit(:title, :description)
  end
  def find_post
    @post = Post.find(params[:id])
  end
end
