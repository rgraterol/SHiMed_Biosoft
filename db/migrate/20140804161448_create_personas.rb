class CreatePersonas < ActiveRecord::Migration
  def change
    create_table :personas do |t|
      t.string :nombre
      t.string :apellido
      t.string :cedula
      t.text :direccion
      t.string :telefono_casa
      t.string :telefono_celular
      t.string :telefono_oficina
      t.integer :sexo
      t.date :fecha_nacimiento

      t.actable as: :es_persona

      t.timestamps
    end
  end
end
