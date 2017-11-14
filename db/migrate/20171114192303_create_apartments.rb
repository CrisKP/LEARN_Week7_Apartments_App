class CreateApartments < ActiveRecord::Migration[5.1]
  def change
    create_table :apartments do |t|
      t.string :street1
      t.string :street2
      t.string :city
      t.integer :postal_code
      t.string :state
      t.string :country
      t.string :manager
      t.string :phone
      t.string :contact_hours

      t.timestamps
    end
  end
end
