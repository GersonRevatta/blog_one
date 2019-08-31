class UsuariosController < ApplicationController
  before_action :find_user, only: [:show]
  def show
  end
  private
  def params_users
    params.require(:user).permit(:email)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
