class OrdersController < ApplicationController
  def index
    orders = Order.all.rent
    render json: orders
  end
  
  def create
    order = Order.new( order_parameter )
    item = Item.find_by(name: params[:name])
    str = item.item_processing_array          #=>model
    order.process = str
    if order.save
      render json: {message: '登録しました。'}
    else
      render json: {message: '失敗しました。'}
    end
  end

  def update
    order = Order.find( params[:id] )
    if order.update_attributes( order_parameter )
      render json: {message: '編集しました。'}
    else
      render json: {message: '失敗しました。'}
    end
  end

  def destroy
    order = Order.find( params[:id] )
    order.destroy
    render json: {message: '削除しました。'}
  end


  def deleteAll
    Order.destroy_all
    render json: {message: 'リセットしました。'}
  end

  def pay
    Payjp.api_key = "sk_test_e3c10e02018b4c9e70bb332b"
    Payjp::Charge.create(
      amount: 8888, 
      card: params['payjpToken'],
      currency: 'jpy'
    )
    render json: {message: "支払い完了しました"}
  end


private
  def order_parameter
    params.permit( :name, :price, :oder_day, :stock )
  end
  
end
