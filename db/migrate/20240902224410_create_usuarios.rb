class CreateUsuarios < ActiveRecord::Migration[7.2]
  def change
    create_table :usuarios do |t|
      t.string :email
      t.string :password_digest
      t.boolean :active

      t.timestamps
    end

    add_index :usuarios, :email, unique: true
  end
end
