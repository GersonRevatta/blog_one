class UsuariosController < ApplicationController
  before_action :find_user, only: [:show, :update]
  def show
  end

  def update
    respond_to do |format|
      if @user.update(params_users)
        format.html { redirect_to @user }
        format.json {render :show }
      else
        format.html {redirect_to @user, notice: @user.errors.full_messages }
        format.json { render json: @user.errors }
      end
    end
  end
  private
  def params_users
    params.require(:user).permit(:email)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
