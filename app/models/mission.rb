class Mission < ApplicationRecord

  # mission_admin is optional: missions can be created by merchants or anonymously
  # depending on the flow. Allow mission_admin to be nil at the model level.
  belongs_to :mission_admin, optional: true
  # Optional association to Merchant: set when a merchant creates a mission
  # (missions can also be created by mission_admins)
  belongs_to :merchant, optional: true
  # Ensure a unique_code exists before validation so presence/uniqueness
  # validations pass when creating a record.
  before_validation :generate_unique_code, on: :create
  validates :unique_code, presence: true, uniqueness: true

  private

  def generate_unique_code
    begin
      self.unique_code = SecureRandom.hex(4)
    end while Mission.exists?(unique_code: self.unique_code)
  end
end
