class OrdersController < ApplicationController
  def index
    orders = Orders.all.rent
    render json: orders
  end
end
