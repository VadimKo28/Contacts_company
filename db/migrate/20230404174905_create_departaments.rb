class CreateDepartaments < ActiveRecord::Migration[5.2]
  def change
    create_table :departaments do |t|
      t.string :title
      t.timestamps
    end
  end
end
