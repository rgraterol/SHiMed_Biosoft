class CreateMedicos < ActiveRecord::Migration
  def change
    create_table :medicos do |t|
      t.string :cmv
      t.text :cv
      t.string :url
      t.string :especialidad_id

      t.timestamps
    end
  end
end
