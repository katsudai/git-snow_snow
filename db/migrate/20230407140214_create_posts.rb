class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.integer :user_id
      t.integer :tag_id
      t.text :body, null: false
      t.string :address
      t.float :latitude
      t.float :longitude
      
      t.timestamps
    end
  end
end
