require 'rails_helper'

describe "ユーザーテスト", type: :request  do
    let!(:user) { FactoryBot.create(
      :user, 
      name: '小太郎',
      email: 'koto@example.com',
      tel: '090-7889-1122',
      password: '123',
      password_confirmation: '123'
      ) }
#############################################################
  describe "ページテスト" do
    it "ページリクエスト成功" do
      post '/users/index'
      expect(response.status).to eq 200
    end
  end
################################################################
  describe "ユーザー新規作成テスト" do
   
    it "新規作成される" do
      valid_params = { 
        name: 'ポチ', 
        email: 'pochi2@example.com',
        tel: '090-7889-1123',
        password: '123',
        password_confirmation: '123'
      }
      expect { post "/users", params: valid_params }.to change(User, :count).by(1) #=>ユーザーが増える
      expect(response.status).to eq 200
    end
  end
  ################################################################
  describe "ユーザー編集テスト" do
    it "編集される" do
      
      valid_params = { 
        name: 'ポチ2', 
        email: 'pochi2@example.com',
        tel: '090-7889-1124',
        password: '123',
        password_confirmation: '123'
      }
      expect { patch user_path(user), params: valid_params }.to change(User, :count).by(0) #=>ユーザーは増えない
      expect(response.status).to eq 200
    end
  end
  describe "ユーザー削除テスト" do
    it "削除される" do
      expect { delete user_path(user)}.to change(User, :count).by(-1) #=>ユーザーが減る
      expect(response.status).to eq 200
    end
  end
  
  
end
