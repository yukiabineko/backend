class ItemsController < ApplicationController
  def index
    items = Item.all
    render json: items
  end

  def show
    item = Item.find( params[:id] )
    render json: item
  end

  def create
    item = Item.new(item_parameter)
    if item.save
      render json: {message: '商品登録しました。'}
    else
      render json: {message: '失敗しました。'}
    end
  end

  def update
    item = Item.find( params[:id] )

    if item.update_attributes(item_parameter)
      render json: {message: '編集しました。'}
    else
      render json: {message: '失敗しました。'}
    end
  end

private
  def item_parameter
    params.permit( :name, :price, :category, :info )
  end
  
end
