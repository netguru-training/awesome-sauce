class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, if: :new_record?

  has_many :rides_as_passenger, class_name: 'Ride', through: :rides_passengers,
            source: 'ride'
  has_many :rides_as_driver, class_name: 'Ride', foreign_key: 'driver_id'
  has_many :rides_passengers, foreign_key: 'passenger_id'
  belongs_to :ride
  has_many :reviews_given, class_name: "Review", :foreign_key => "author_id"
  has_many :reviews_received, class_name: "Review", :foreign_key => "user_id"

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100#" },
                    default_url: "/images/:style/missing-avatar.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  validates :name, presence: true

  def completed_rides_as_passenger
    rides_as_passenger.completed.with_accepted_requests
  end

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
