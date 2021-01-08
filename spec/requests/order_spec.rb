require 'rails_helper'

describe "商品テスト", type: :request  do
    let!(:order) { FactoryBot.create(
      :order, 
      name: 'あさり',
      price: 150,
      stock: 26,
      ) }
    let!(:item) { FactoryBot.create(
      :item, 
      name: 'いか',
      price: 100,
      category: 'ｲｶ',
      info: '味噌汁用'
      ) }
#############################################################
  describe "ページテスト" do
    it "ページリクエスト成功" do
      get orders_path
      expect(response.status).to eq 200
    end
  end
################################################################
  describe "オーダー作成テスト" do
    
    it "新規作成される" do
      valid_params = { 
        name: 'いか', 
        price: 100,
        stock: 8
      }
      expect { post orders_path, params: valid_params }.to change(Order, :count).by(1) #=>ユーザーが増える
      expect(response.status).to eq 200
    end
  end
###################################################################
  describe "オーダー編集テスト" do
    it "編集される" do
      
      valid_params = { 
        name: 'たこ', 
        price: 400,
        stock: 5
      }
      expect { patch order_path(order), params: valid_params }.to change(Order, :count).by(0) #=>ユーザーは増えない
      expect(response.status).to eq 200
    end
  end
######################################################################
describe "オーダー削除テスト" do
  it "削除される" do
    expect { delete order_path(order)}.to change(Order, :count).by(-1) #=>ユーザーが減る
    expect(response.status).to eq 200
  end
end
#####################################################################################
  describe "オーダー削除テスト" do
    it "削除される" do
      count = Order.count
      get deleteAll_orders_path
      expect(Order.count).to eq 0       #=>リセット成功
      expect(response.status).to eq 200
    end
  end
end
