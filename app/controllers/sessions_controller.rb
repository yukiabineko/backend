class SessionsController < ApplicationController
  def create
    user = User.find_by( email: params[ :email ])
    if user&.authenticate(params[:password])
      render json: user
    else
      render json: {message: 'ログインに失敗しました。'}
    end
  end
end
