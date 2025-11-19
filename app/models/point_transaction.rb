class PointTransaction < ApplicationRecord
  belongs_to :user
  belongs_to :merchant, optional: true
  belongs_to :mission, optional: true
end
