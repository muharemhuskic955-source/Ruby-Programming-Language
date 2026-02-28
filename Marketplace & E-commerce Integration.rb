class MarketplaceItem < ApplicationRecord
  belongs_to :seller, class_name: 'User'
  has_many :orders, dependent: :destroy
  has_many_attached :images
  
  enum condition: { new: 0, used: 1, refurbished: 2 }
  enum status: { draft: 0, active: 1, sold: 2, archived: 3 }
  
  validates :title, :price, :description, presence: true
  validates :price, numericality: { greater_than: 0 }
end

class Order < ApplicationRecord
  belongs_to :buyer, class_name: 'User'
  belongs_to :seller, class_name: 'User'
  belongs_to :marketplace_item
  
  enum status: { pending: 0, confirmed: 1, shipped: 2, delivered: 3, cancelled: 4 }
end