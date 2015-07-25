class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :author_id, index: true
      t.integer :user_id, index: true
      t.integer :rating

      t.timestamps null: false
    end    
  end
end
