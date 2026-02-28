class Feature < ApplicationRecord
  has_many :feature_accesses, dependent: :destroy
  has_many :users, through: :feature_accesses
  
  enum category: { premium: 0, business: 1, exclusive: 2 }
end

class FeatureAccess < ApplicationRecord
  belongs_to :user
  belongs_to :feature
  belongs_to :subscription, optional: true
  
  def available?
    subscription&.active? || one_time_purchase?
  end
end