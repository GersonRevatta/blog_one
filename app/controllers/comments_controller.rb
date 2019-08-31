class CommentsController < ApplicationController
  before_action :find_post, only: [:create, :destroy]
  before_action :find_comment, only: :destroy
  before_action :authenticate_user!
  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    @comment.save ? (redirect_to @post, notice: 'Mensaje exitoso') : (redirect_to @post, notice: 'No se creo mensaje')
  end

  def destroy
    @comment.destroy ? (redirect_to @post, notice: 'Mensaje eliminado') : (redirect_to @post, notice: 'No se pudo eliminar el mensaje')
  end
  private
  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_comment
    @comment = @post.comments.find(params[:id])
  end
end
