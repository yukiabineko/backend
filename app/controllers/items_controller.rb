class ItemsController < ApplicationController
  def index
    items = Item.all.order(id: :asc)
    array = []

    items.each do |item|
     hash = {}
     hash["id"] = item.id
     hash["name"] = item.name
     hash["price"] = item.price
     hash["category"] = item.category
     hash["info"] = item.info
     hash["processes"] = []
     array << hash
     item.processings.all.each do |processing|
      hash["processes"] << processing.processing_name
     end
     
    end
    render json: array
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

  def destroy
    item = Item.find( params[:id] )
    item.destroy
    render json: {message: '削除しました。'}
  end
  

private
  def item_parameter
    params.permit( :name, :price, :category, :info )
  end
  
end
