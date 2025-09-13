class Mission < ApplicationRecord
  belongs_to :merchant
  validates :complete_code, presence: true, uniqueness: true
  before_create :generate_complete_code

  private

  def generate_complete_code
    begin
      self.complete_code = SecureRandom.hex(4)
    end while Mission.exists?(complete_code: self.complete_code)
  end
end
