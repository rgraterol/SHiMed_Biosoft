class CreateCentroSaluds < ActiveRecord::Migration
  def change
    create_table :centro_saluds do |t|
      t.boolean :publico

      t.timestamps
    end
  end
end
