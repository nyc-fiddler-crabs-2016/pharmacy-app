class Medicines < ActiveRecord::Migration
  def change
    create_table :medicines do |t|
      t.string :name, null: false
      t.references :active_ingredient, index: true, null: false
      t.integer :dose, null: false

      t.timestamps null: false
    end
  end
end
