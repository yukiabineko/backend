require 'rails_helper'

describe "ユーザーテスト", type: :request  do
    let!(:user) { FactoryBot.create(
      :user, 
      name: '小太郎',
      email: 'koto@example.com',
      password: '123',
      password_confirmation: '123'
      ) }
#############################################################
  describe "ページテスト" do
    it "ページリクエスト成功" do
      get users_path
      expect(response.status).to eq 200
    end
  end
###############################################################
  describe "ユーザー新規作成テスト" do
    it "新規作成される" do
      valid_params = { 
        name: 'ポチ', 
        email: 'pochi@example.com',
        password: '123',
        password_confirmation: '123'
      }
      expect { post users_path, params: valid_params }.to change(User, :count).by(1) #=>ユーザーが増える
      expect(response.status).to eq 200
    end
    
  end
  
  
end
