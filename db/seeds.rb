# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
    name: '太郎',
    email: 'taro@example.com',
    password: '123',
    password_confirmation: '123'
)
User.create!(
    name: '次郎',
    email: 'jiro@example.com',
    password: '123',
    password_confirmation: '123'
)
Item.create!(
    name: '真あじ',
    price: 120,
    category: '青魚',
    info: '大衆魚です。様々な調理に利用できます。'
)
Item.create!(
    name: '真ガレイ',
    price: 400,
    category: '白身魚',
    info: '煮物に最適。'
)
Item.create!(
    name: '帆立貝',
    price: 150,
    category: '貝類',
    info: '風味のある色々な調理に向いてます。'
)
Order.create!(
    name: '真あじ',
    price: 120,
    stock: 12
)
Order.create!(
    name: '帆立貝',
    price: 150,
    stock: 10
)
Processing.create!(
	processing_name: '刺身',
	item_id: 1
)
Processing.create!(
	processing_name: '塩焼き',
	item_id: 1
)

