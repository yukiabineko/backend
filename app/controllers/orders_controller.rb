class OrdersController < ApplicationController
  def index
    orders = Order.all.rent
    render json: orders
  end
end
