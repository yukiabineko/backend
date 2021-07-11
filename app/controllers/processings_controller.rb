class ProcessingsController < ApplicationController
  def show
    item = Item.find( params[:id] )
    processings = item.processings.all
    render json: processings
  end

  def create
    item = Item.find( params[:id] )
     #送信元がwebアプリの場合
    if params[:data]
      params[:data].each do |data|
        processing = item.processings.new(processing_name: data[:value])
        processing.save
      end
      render json:{message: '送信しました。'}

    ##送信元がwindowsアプリの場合
    elsif params[:win_processes]
      array = windows_string_to_array(params[:win_processes], item)
      array.each do |data|
        processing = item.processings.new(processing_name: data)
        processing.save
      end
      render json:{message: '送信しました。'}
    end
    
  end


  def destroy
    processing = Processing.find( params[:id] )
    processing.destroy
    render json: {message: '削除しました。'}
  end
private

## windows版の設定
  def windows_string_to_array(strings,item)  
     newArray = []
     strings.split(",").each do |string|
        ##被りプロセスあるか確認(item modelにて)
        result = item.existing_process_check(string)
        if(result == true)
          string.present? ?newArray<< string : ""
        end
     end
     return newArray.uniq
  end


  
end
