class Merchant < ApplicationRecord
  MUNICIPALITIES = {
    1 => "松江市",
    2 => "浜田市",
    3 => "出雲市",
    4 => "邑南町"
  }.freeze

  def municipality_name
    MUNICIPALITIES[municipality_id]
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :missions, dependent: :destroy
  has_many :payments, dependent: :destroy
end
