class AddStatusTo < ActiveRecord::Migration[5.2]
  def change
    add_column :shoppings, :status, :integer, default: 0
  end
end
