class CreateProcessings < ActiveRecord::Migration[5.2]
  def change
    create_table :processings do |t|
      t.string :processing_name
      t.references :item

      t.timestamps
    end
  end
end
