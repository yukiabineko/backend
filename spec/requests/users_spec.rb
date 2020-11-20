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
  
end
