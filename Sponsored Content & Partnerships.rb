class SponsoredPost < ApplicationRecord
  belongs_to :user  # Sponsor
  belongs_to :post
  belongs_to :campaign
  
  enum placement: { feed: 0, trending: 1, featured: 2 }
  enum status: { pending: 0, approved: 1, rejected: 2, live: 3, ended: 4 }
  
  validates :budget, :start_date, :end_date, presence: true
end

class Campaign < ApplicationRecord
  belongs_to :user
  has_many :sponsored_posts, dependent: :destroy
  
  enum type: { brand_awareness: 0, product_promotion: 1, event_promotion: 2 }
end