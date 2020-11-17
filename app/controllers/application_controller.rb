class ApplicationController < ActionController::API
  def hello_world
    render json: { text: "Hello World" }
  end
end
