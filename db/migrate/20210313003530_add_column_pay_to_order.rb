class AddColumnPayToOrder < ActiveRecord::Migration[5.2]
  #
  def change
    add_column :shoppings, :pay, :boolean, default: false
  end
end
