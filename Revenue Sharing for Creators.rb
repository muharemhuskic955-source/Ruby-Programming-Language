class CreatorAccount < ApplicationRecord
  belongs_to :user
  has_many :revenue_shares, dependent: :destroy
  
  enum tier: { basic: 0, silver: 1, gold: 2, platinum: 3 }
  
  def revenue_share_percentage
    case tier
    when 'basic'
      0.70  # 70% to creator
    when 'silver'
      0.75
    when 'gold'
      0.80
    when 'platinum'
      0.85
    end
  end
end

class RevenueShare < ApplicationRecord
  belongs_to :creator_account
  belongs_to :transaction
  
  validates :amount, :share_percentage, presence: true
end
