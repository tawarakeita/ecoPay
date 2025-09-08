class PointTransaction < ApplicationRecord
  belongs_to :user
  belongs_to :merchant
  belongs_to :mission
end
