FactoryBot.define do
  factory :item do
    name { 'サーモン' }
    price{ 1000 }
    category{ '大型魚' }
    info{ '刺身用' }
  end
end