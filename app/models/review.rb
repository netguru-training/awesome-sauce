class Review < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  belongs_to :user

  validates_presence_of :author_id, :user_id, :rating, :content
  validates :rating, inclusion: { in: 1..5 }
  validates :content, length: { maximum: 100 }
end
