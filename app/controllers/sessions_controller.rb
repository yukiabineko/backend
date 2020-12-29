class SessionsController < ApplicationController
  def create
    user = User.find_by( email: params[ :email ])
    if user&.authenticate(params[:password])
      data  = user.user_history
      render json: user
    else
      render json: {message: 'ログインに失敗しました。'}
    end
  end
end
