FactoryBot.define do
  factory :user do
    name { '五郎' }
    email{ 'goro@example.com' }
    password{ '123' }
    password_confirmation{ '123' }
  end
end