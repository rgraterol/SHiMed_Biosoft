class CreateCiudads < ActiveRecord::Migration
  def change
    create_table :ciudads do |t|
      t.string :nombre

      t.integer :estado_id

      t.timestamps
    end
  end
end
