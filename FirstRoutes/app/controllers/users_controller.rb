class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: 422
    end
  end

  def show
    user = User.find_by(id: params[:id])
    if user
      render json: user
    else
      render json: "user does not exist", status: 418
    end
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    user.save

    render json: user
  end

  def destroy
    user = User.find(params[:id])
    user.destroy

    render json: user
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end

end