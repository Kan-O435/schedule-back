class UsersController < ApplicationController
    #skip_before_action :authenticate_user! , only: [:index, :show]

  def show
    @user = User.find(params[:id])
    render json: @user.as_json(only: [:id, :name, :mail])
  end

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user.as_json(only: [:id, :name, :mail]), status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :mail, :password, :password_confirmation)
  end
end
