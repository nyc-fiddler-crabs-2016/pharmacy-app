class ActiveIngredients < ActiveRecord::Migration
  def change
    create_table :active_ingredients do |t|
    t.string :name, null: false

    t.timestamps null: false
    end
  end
end
