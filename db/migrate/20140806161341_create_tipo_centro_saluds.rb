class CreateTipoCentroSaluds < ActiveRecord::Migration
  def change
    create_table :tipo_centro_saluds do |t|
      t.string :nombre
      t.text :descripcion

      t.timestamps
    end
  end
end
