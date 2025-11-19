class Mission < ApplicationRecord

  def merchant_record
    return nil unless respond_to?(:merchant_id)
    Merchant.find_by(id: merchant_id)
  end
  validates :unique_code, presence: true, uniqueness: true
  before_create :generate_unique_code

  private

  def generate_unique_code
    begin
      self.unique_code = SecureRandom.hex(4)
    end while Mission.exists?(unique_code: self.unique_code)
  end
end
