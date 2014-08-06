class CreateEmpresas < ActiveRecord::Migration
  def change
    create_table :empresas do |t|
      t.string :nombre
      t.string :rif
      t.text :direccion
      t.text :direccionFiscal
      t.string :telefono
      t.string :fax
      t.string :url
      t.date :fechaCreacion

      t.integer :ciudad_id
      t.integer :municipio_id
      t.actable as: :es_empresa

      t.timestamps
    end
  end
end
