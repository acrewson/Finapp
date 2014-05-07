class PaymentMethod < ActiveRecord::Base
  has_many :expenses

end
