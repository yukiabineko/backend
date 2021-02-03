class SalesController < ApplicationController
  def index
    datas = Shopping.sale_data(params[:date])
    render json: datas
  end
end
