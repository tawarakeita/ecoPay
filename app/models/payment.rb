class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :merchant
  has_many :payments, dependent: :destroy
end
