class Review < ActiveRecord::Base
  validates :user, uniqueness: { scope: :restaurant, message: "has reviewed this restaurant already" }
  belongs_to :restaurant
  validates :rating, inclusion: (1..5)
  belongs_to :user

  


end
