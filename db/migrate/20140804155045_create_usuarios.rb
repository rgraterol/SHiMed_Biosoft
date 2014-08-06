class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :email
      t.string :password_digest
      t.integer :tipo_actor, default: 0
      t.integer :rol_id, default: 0
      t.string :foto

      t.actable as: :es_usuario

      t.timestamps
    end
  end
end
