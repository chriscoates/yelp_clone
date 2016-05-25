class Restaurant < ActiveRecord::Base
  has_many :reviews, dependent: :destroy do
    def build_with_user(attributes = {}, user)
      attributes[:user] ||= user
      build(attributes)
    end
  end

  validates :name, length: { minimum: 3 }, uniqueness: true

  def build_review(attributes, current_user)
    attributes[:user] ||= current_user
    reviews.build(attributes)
  end
end
