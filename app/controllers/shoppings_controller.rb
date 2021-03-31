class ShoppingsController < ApplicationController
  before_action :current_user_check?

  def index
    if current_user_check?
      shoppings = User.joins(:shoppings).select('shoppings.*, users.name AS user_name').order(receiving_time: :desc)
      render json: shoppings
    else
      render json: []
    end
    
  end

  #注文作成

  def create
    if current_user_check?
      message = '失敗。'
      user = User.find( params[:id] )
      params[:data].each do |param|
        order = Order.find_by(name: param[:name])
        order.stock -= param[:num].to_i
        order.save
        
        user.user_shopping(param)
        message ='注文しました。'
        puts "test"
      end
      render json: {message: message}
    else
      render json: {message: '入力が不正です。失敗しました。'}
    end
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
      Time.new.day + 1,
      hour,
      min,0
    )
   end
    return time 
  end
end
