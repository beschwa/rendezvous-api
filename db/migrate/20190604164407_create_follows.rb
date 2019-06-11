class CreateFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :follows do |t|
      t.integer :follower_id, index: true, foreign_key: true
      t.integer :followed_id, index: true, foreign_key: true
      t.timestamps
    end
  end
end
