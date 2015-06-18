class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :email


      t.timestamps null: false
    end

    add_index :reservations, :contact_id
  end
end
