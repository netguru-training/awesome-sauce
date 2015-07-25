class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  validates :name, presence: true

  has_many :reviews_given, class_name: "Review", :foreign_key => "author_id"
  has_many :reviews_received, class_name: "Review", :foreign_key => "user_id"

  def average_rating
    if reviews_received.any?
      reviews_received.average(:rating).round(2)
    else
      "n/a"
    end
  end

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
