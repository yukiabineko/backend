class UsersController < ApplicationController
  before_action :current_user_check?
  
  def index
    if current_user_check?
      users = User.all.sort_user
      render json: users
    else
      render json: []
    end
    
  end

  def create
    user = User.new( user_parameter )
    #employeeパラメーターが付与された場合登録禁止
    if params[:employee]
        render json: {message: '登録失敗しました。内容を確認してください'}

    #employeeパラメーターが付与されない場合登録開始
    else
      if user.save
        render json: {message: '登録しました', userData: user.user_history}

      else
        errors = user.errors.full_messages
        render json: {message: errors}
      end
    end
  end


  def update
    if current_user_check?
      user = User.find( params[:id] )
      if user.update_attributes( user_parameter )
        render json: {message: '編集しました'}
      else
        errors = user.errors.full_messages
        render json: {message: errors}  
      end
    else
      render json: {message: '編集失敗しました。不正な動作です。'}
    end
    
  end


  def show
    if current_user_check?
      user = User.find( params[:id] )
      render json: user.user_history
    else
      render json: []
    end
  end

  def user_show
    user = User.find_by(name: params[:name] )
    render json: user.user_history
  end

  def destroy
    if current_user_check?
      user = User.find( params[:id] )
      user.destroy
      render json: {message: '削除しました。'}
    else
      render json: {message: '不正な操作です。削除失敗しました。'}
    end
   
  end

private
  def user_parameter
    params.permit( :name, :email, :tel,  :password, :password_confirmation)
  end
  
  def set_user
    
  end
end
