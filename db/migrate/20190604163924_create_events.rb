class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.belongs_to :user, foreign_key: true
      t.string :name
      t.string :image_url
      t.string :relevant_url
      t.text :description
      t.integer :size
      t.datetime :when
      t.string :location
      t.boolean :private

      t.timestamps
    end
  end
end
