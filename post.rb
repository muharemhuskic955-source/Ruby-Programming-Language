class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, :content, presence: true
  validates :title, length: { maximum: 150 }
end