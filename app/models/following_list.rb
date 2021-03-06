class FollowingList < ApplicationRecord
    validates :user_id, :product_listing_id, presence: true

    belongs_to :user,
    foreign_key: :user_id,
    class_name: :User
end
