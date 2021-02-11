class ShoppingPhoneController < ApplicationController

  def create
    message = '失敗。'
    debugger
    order = Order.find_by(name: param[:name])
    order.stock -= param[:num].to_i
    order.save

    user = User.find( params[:id] )
    if param
      shoping = user.shopings.create(
        name: param[:name],
        price: param[:price],
        num: param[:num],
        process: param[:process],
        shopping_date: (Date.today + 1).strftime('%Y/%m/%d'),
        receiving_time: receiving(param[:time])
      )
      message = '登録しました'
    end
   render json: message
  end
end
