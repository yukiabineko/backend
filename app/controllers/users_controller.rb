class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def create
    user = User.new( user_parameter )
    if user.save
      render json: {message: '登録しました'}
    else
      render json: {message: '登録失敗しました。内容を確認してください'}
    end
  end

  def update
    user = User.find( params[:id] )
    if user.update_attributes( user_parameter )
      render json: {message: '編集しました'}
    else
      render json: {message: '編集失敗しました。内容を確認してください'}
    end
  end


  def show
    user = User.find( params[:id] )
    render json: user
  end

private
  def user_parameter
    params.permit( :name, :email, :password, :password_confirmation)
  end
end