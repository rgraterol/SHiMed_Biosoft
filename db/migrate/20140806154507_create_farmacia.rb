class CreateFarmacia < ActiveRecord::Migration
  def change
    create_table :farmacia do |t|
      t.string :reg_sanitario

      t.timestamps
    end
  end
end
