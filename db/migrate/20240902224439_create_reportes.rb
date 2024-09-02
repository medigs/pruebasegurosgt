class CreateReportes < ActiveRecord::Migration[7.2]
  def change
    create_table :reportes do |t|
      t.string :nombre_reporte
      t.integer :estado
      t.references :usuario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
