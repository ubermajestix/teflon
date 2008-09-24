class CreateShows < ActiveRecord::Migration
  def self.up
    create_table :shows do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.float :ticket_price
      t.string :city
      t.string :state
      t.string :venue
      t.datetime  :showtime
      t.boolean :published, :default => 0
      

      t.timestamps
    end
  end

  def self.down
    drop_table :shows
  end
end
