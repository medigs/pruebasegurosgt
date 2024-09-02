class ChangeActiveDefaultInUsuarios < ActiveRecord::Migration[7.2]
  def change
    change_column_default :usuarios, :active, true
  end
end
