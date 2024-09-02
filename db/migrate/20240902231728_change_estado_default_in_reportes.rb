class ChangeEstadoDefaultInReportes < ActiveRecord::Migration[7.2]
  def change
    change_column_default :reportes, :estado, 0
  end
end
