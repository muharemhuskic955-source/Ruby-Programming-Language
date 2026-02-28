class Advertisement < ApplicationRecord
  belongs_to :user  # Advertiser
  belongs_to :target_group, optional: true
  has_many :ad_impressions, dependent: :destroy
  has_many :ad_clicks, dependent: :destroy
  
  enum status: { draft: 0, pending: 1, approved: 2, rejected: 3, running: 4, paused: 5 }
  enum placement: { feed: 0, sidebar: 1, header: 2, footer: 3, popup: 4 }
  
  validates :title, :content, :budget, presence: true
end

class AdImpression < ApplicationRecord
  belongs_to :advertisement
  belongs_to :user  # Viewer
end

class AdClick < ApplicationRecord
  belongs_to :advertisement
  belongs_to :user
end