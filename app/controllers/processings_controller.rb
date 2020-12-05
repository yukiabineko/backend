class ProcessingsController < ApplicationController
  def show
    item = Item.find( params[:id] )
    processings = item.processings.all
    render json: processings
  end

  def create
    item = Item.find( params[:item_id] )
    processing = item.processings.new(processing_name: params[:processing_name])
    if processings.save
      render json: {message: '登録しました。'}
    else
      render json: {message: '失敗しました。'}
    end
  end


  def destroy
    
  end
  
  
end
