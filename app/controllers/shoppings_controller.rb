class ShoppingsController < ApplicationController
  def index
    shoppings = User.joins(:shoppings).select('shoppings.*, users.name AS user_name')
    render json: shoppings
  end

  def create
    message = '失敗。'
    user = User.find( params[:id] )
    params[:data].each do |param|
      user.shoppings.create!(
        name: param[:name],
        price: param[:price],
        num: param[:num],
        process: param[:process]
      )
      message ='注文しました。'
    end
    render json: {message: message}
  end

  def show
  end
end
