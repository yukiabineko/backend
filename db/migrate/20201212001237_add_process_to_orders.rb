class AddProcessToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :process, :text
    
  end
end
