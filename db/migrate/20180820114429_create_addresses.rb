class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :first_line
      t.string :second_line
      t.string :city
      t.integer :pin
      t.string :state
      t.integer :user_id
      t.timestamps
    end
  end
end
