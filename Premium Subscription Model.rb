# Generate subscription model
rails generate model Subscription user:references plan:references status:integer expires_at:datetime

class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  
  enum status: { active: 0, inactive: 1, cancelled: 2 }
  
  def active?
    super && expires_at > Time.current
  end
end

class Plan < ApplicationRecord
  has_many :subscriptions
  
  enum type: { basic: 0, premium: 1, business: 2 }
  
  def monthly_price
    case type
    when 'basic'
      0  # Free tier
    when 'premium'
      9.99
    when 'business'
      29.99
    end
  end
end