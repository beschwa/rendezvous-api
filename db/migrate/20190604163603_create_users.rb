class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :avatar
      t.string :display_name
      t.string :full_name
      t.string :email
      t.string :tagline
      t.string :birthday
      t.string :location
      t.string :occupation
      t.string :gender
      t.string :orientation
      t.string :romantic_preference
      t.string :relationship_status
      t.text :bio

      t.timestamps
    end
  end
end
