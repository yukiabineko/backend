class ShoppingPhoneController < ApplicationController

  def create
    message = '失敗。'
    order = Order.find_by(name: params[:name])
    order.stock -= params[:num].to_i
    order.save
    time = receiving( params[:time] )
    user = User.find( params[:id] )
    
    if params
      shoping = user.shoppings.create(
        name: params[:name],
        price: params[:price],
        num: params[:num],
        process: params[:process],
        shopping_date: (Date.today + 1).strftime('%Y/%m/%d'),
        receiving_time:  time
        
      )
      message = '登録しました'
    end
   render json: {message: message}
  end

  private
   #受け取り時間設定

   def receiving(time)
   if time.present?
    time_array = time.split(':')
    hour = time_array[0]
    min = time_array[1]
    time = Time.local(
      Time.new.year,
      Time.new.month,
      Time.new.day + 1,
      hour,
      min,0
    )
   end
    return time 
  end
end
