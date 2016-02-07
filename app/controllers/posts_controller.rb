class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = 'Post has been created.'
      redirect_to posts_path
    else
      flash.now[:alert] = 'Post has not been created.'
      render 'new'
    end
  end

  def show
    @comment = @post.comments.build
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)

      flash[:notice]= 'Post has been updated.'
      redirect_to @post
    else
      flash.now[:alert] = 'Post has not been updated.'
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    flash[:notice]= 'Post has been deleted.'
    redirect_to posts_path(@app)
  end
  private

  def post_params
    params.require(:post).permit(:title, :content, :attachment)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
