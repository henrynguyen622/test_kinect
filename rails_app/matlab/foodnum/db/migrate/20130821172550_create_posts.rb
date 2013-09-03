class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.integer :original_post_id
      t.integer :wall_id
      t.integer :author_id
      t.string  :text
      t.string :postphoto
      t.string :title
      t.integer :rating
      t.string :location
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
