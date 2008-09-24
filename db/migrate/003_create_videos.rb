class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.string :title
      t.integer :user_id
      t.text :embed

      t.timestamps
    end
  end

  def self.down
    drop_table :videos
  end
end
