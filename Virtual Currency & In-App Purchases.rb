class VirtualCurrency < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :destroy
  
  validates :balance, numericality: { greater_than_or_equal_to: 0 }
  
  def add_coins(amount)
    update(balance: balance + amount)
  end
  
  def spend_coins(amount)
    return false if balance < amount
    update(balance: balance - amount)
  end
end

class Transaction < ApplicationRecord
  belongs_to :virtual_currency
  belongs_to :user
  
  enum type: { purchase: 0, gift: 1, bonus: 2, spending: 3 }
  enum status: { pending: 0, completed: 1, failed: 2, refunded: 3 }
end