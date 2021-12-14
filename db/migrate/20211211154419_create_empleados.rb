class CreateEmpleados < ActiveRecord::Migration[6.1]
  def change
    create_table :empleados do |t|
      t.string :nombre
      t.string :apellido
      t.integer :edad
      t.string :email
      t.references :sede, null: false, foreign_key: true

      t.timestamps
    end
  end
end
