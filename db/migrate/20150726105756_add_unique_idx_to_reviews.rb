class AddUniqueIdxToReviews < ActiveRecord::Migration
  def change
    add_index :reviews, [:author_id, :user_id], :unique => true
  end
end
