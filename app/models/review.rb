class Review < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  belongs_to :user

  validates_presence_of :author_id, :user_id, :rating
  validates_inclusion_of :number, :in => 1..5
end
