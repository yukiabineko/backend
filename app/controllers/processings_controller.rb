class ProcessingsController < ApplicationController
  def show
    item = Item.find( params[:id] )
    processings = item.processings.all
    render json: processings
  end

  def create
    item = Item.find( params[:id] )
    params[:data].each do |data|
      processing = item.processings.new(processing_name: data[:value])
      processing.save
    end
    render json:{message: '送信しました。'}
  end


  def destroy
    
  end
  
  
end
