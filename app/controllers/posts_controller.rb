class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @posts = params[:my_posts].present? ? current_user.posts : Post.all
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post  = current_user.posts.new(post_params)
    @post.save ? (redirect_to @post, notice: 'Creado!!') : (render 'new')
  end

  def show
  end

  def edit
  end

  def update
    @post.update(post_params) ? (redirect_to @post, notice: 'Actualizado!!') : (render 'edit')
  end

  def destroy
    @post.destroy ? (redirect_to posts_path, notice: 'Eliminado!!') : (redirect_to posts_path)
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
