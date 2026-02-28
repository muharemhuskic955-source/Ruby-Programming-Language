class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :payment_method, optional: true
  
  enum payment_type: { subscription: 0, ad_campaign: 1, premium_feature: 2, virtual_currency: 3 }
  enum status: { pending: 0, completed: 1, failed: 2, refunded: 3 }
  enum provider: { stripe: 0, paypal: 1, apple_pay: 2, google_pay: 3 }
  
  validates :amount, :payment_type, presence: true
end

class PaymentMethod < ApplicationRecord
  belongs_to :user
  
  enum type: { credit_card: 0, debit_card: 1, bank_account: 2, paypal: 3 }
end