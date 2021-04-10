class ApplicationController < ActionController::API
  def hello_world
    render json: { text: "Hello World", message: "test", status: current_user_check? }
  end

  def current_user_check?
    status = false
    user = User.find_by( email: params[ :email ])
    if user&.authenticate(params[:password])
      status = true
    end
    return status
  end

  def current_user_check_edit?
    status = false
    user = User.find_by( email: params[ :oldmail ])
    if user&.authenticate(params[:password])
      status = true
    end
    return status
  end

end
