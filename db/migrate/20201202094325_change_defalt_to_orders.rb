class ChangeDefaltToOrders < ActiveRecord::Migration[5.2]
  def up
    change_column :orders, :oder_day, :date, default:  Date.today + 1
  end

  def down
    change_column :orders, :oder_day, :date
  end
end
