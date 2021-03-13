class AddColumnPayToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :pay, :boolean, default: false
  end
end
