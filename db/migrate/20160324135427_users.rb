class Users < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false, unique: true
      t.string :password_digest, null: false
      t.string :name, null: false
      t.string :insurance
      t.integer :age, null: false # CHANGE THIS TO DOB YOU FOOL
      t.string :gender, null: false

      t.timestamps null: false
    end
  end
end
