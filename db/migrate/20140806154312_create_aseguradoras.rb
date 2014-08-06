class CreateAseguradoras < ActiveRecord::Migration
  def change
    create_table :aseguradoras do |t|
      t.string :registro_go

      t.timestamps
    end
  end
end
