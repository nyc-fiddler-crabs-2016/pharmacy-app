class Prescriptions < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.references :patient, index: true, null: false
      t.references :medicine, index: true, null: false

      t.timestamps null: false
    end
  end
end
