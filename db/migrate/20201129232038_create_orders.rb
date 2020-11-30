class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :name
      t.integer :price
      t.date :oder_day
      t.integer :stock

      t.timestamps
    end
  end
end
