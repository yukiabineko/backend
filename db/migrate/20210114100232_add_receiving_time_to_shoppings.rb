class AddReceivingTimeToShoppings < ActiveRecord::Migration[5.2]
  def change
    add_column :shoppings, :receiving_time, :datetime
  end
end
