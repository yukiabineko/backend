require 'rails_helper'

describe "商品テスト", type: :request  do
    let!(:item) { FactoryBot.create(
      :item, 
      name: 'あさり',
      price: 150,
      category: 100,
      info: '味噌汁用'
      ) }
#############################################################
  describe "ページテスト" do
    it "ページリクエスト成功" do
      post '/users/index'
      expect(response.status).to eq 200
    end
  end
################################################################
describe "商品新規作成テスト" do
   
  it "新規作成される" do
    valid_params = { 
      name: 'いか', 
      price: 100,
      category: 'いか、たこ',
      info: ''
    }
    expect { post items_path, params: valid_params }.to change(Item, :count).by(1) #=>ユーザーが増える
    expect(response.status).to eq 200
  end
end
 ################################################################
  describe "商品編集テスト" do
    it "編集される" do
      
      valid_params = { 
        name: 'たこ', 
        price: 400,
        category: 'いか、たこ',
        info: ''
      }
      expect { patch item_path(item), params: valid_params }.to change(Item, :count).by(0) #=>ユーザーは増えない
      expect(response.status).to eq 200
    end
  end
######################################################################
  describe "商品削除テスト" do
    it "削除される" do
      expect { delete item_path(item)}.to change(Item, :count).by(-1) #=>ユーザーが減る
      expect(response.status).to eq 200
    end
  end
end
