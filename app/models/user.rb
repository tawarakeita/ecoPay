class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :payments, dependent: :destroy

  has_many :point_transactions
  def current_points
    point_transactions.sum(
      "CASE WHEN transaction_type = 'earn' THEN amount WHEN transaction_type = 'use' THEN -amount ELSE 0 END"
    )
  end
end
