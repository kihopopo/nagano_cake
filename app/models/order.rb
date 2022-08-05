class Order < ApplicationRecord
  belongs_to :customer

def shipping_cost
  800
end

def total_payment
  shipping_cost ＋ @total
end


  enum payment_method: { credit_card: 0, transfer: 1 }
end
