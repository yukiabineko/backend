class CreateShoppings < ActiveRecord::Migration[5.2]
  def change
    create_table :shoppings do |t|
      t.string :name
      t.date :shopping_date, default: Date.today + 1
      t.integer :price
      t.integer :num
      t.string :process
      t.references :user

      t.timestamps
    end
  end
end
