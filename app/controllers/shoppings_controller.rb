class ShoppingsController < ApplicationController
  def index
    shoppings = User.joins(:shoppings).select('shoppings.*, users.name AS user_name').order(receiving_time: :desc)
    render json: shoppings
  end

  #注文作成

  def create
    message = '失敗。'
    user = User.find( params[:id] )
    params[:data].each do |param|
      order = Order.find_by(name: param[:name])
      order.stock -= param[:num].to_i
      order.save
      
      shoping = user.shoppings.create!(
        name: param[:name],
        price: param[:price],
        
        num: param[:num],
        process: param[:process],
        shopping_date: (Date.today + 1).strftime('%Y/%m/%d'),
        receiving_time: receiving(param[:time])
      )
      message ='注文しました。'
    end
    render json: {message: message}
  end


  #ステータス変更
  def update
    user = User.find_by(name: params[:name] )
    puts user.name
    shopping = Shopping.find( params[:id] )
    if shopping.update_attributes(status: params[:status])
      render json: {message: '注文状況を更新しました。'}
    end
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
      Time.new.day,
      hour,
      min,0
    )
   end
    return time 
  end
end
