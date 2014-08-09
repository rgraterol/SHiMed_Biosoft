class CreateCentroExamenes < ActiveRecord::Migration
  def change
    create_table :centro_examenes do |t|

      t.timestamps
    end
  end
end
