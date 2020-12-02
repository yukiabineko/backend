class ChangeDefaltToOrders < ActiveRecord::Migration[5.2]
  def up
    change_column :orders, :oder_daye, :date, default:  Date.today + 1
  end

  def down
    change_column :orders, :oder_daye, :date
  end
end
