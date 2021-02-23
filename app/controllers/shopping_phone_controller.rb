class ShoppingPhoneController < ApplicationController

  def create
    debugger
    message = '失敗。'
    order = Order.find_by(name: params[:name])
    order.stock -= params[:num].to_i
    order.save

    user = User.find( params[:id] )
    if params
      shoping = user.shoppings.create(
        name: params[:name],
        price: params[:price],
        num: params[:num],
        process: params[:process],
        shopping_date: (Date.today + 1).strftime('%Y/%m/%d'),
        receiving_time:  "#{(Date.today + 1).strftime('%Y/%m/%d')} #{param[:time].to_s}"
        
      )
      message = '登録しました'
    end
   render json: {message: message}
  end
end
