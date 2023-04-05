class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.references :departament, foreign_key: true
      t.string :name 
      t.string :telephone
      t.string :email
      t.timestamps
    end
  end
end
