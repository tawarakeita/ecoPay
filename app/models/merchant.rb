class Merchant < ApplicationRecord
  MUNICIPALITIES = {
    1 => "松江市",
    2 => "浜田市",
    3 => "出雲市",
    4 => "益田市",
    5 => "大田市",
    6 => "安来市",
    7 => "江津市",
    8 => "雲南市",
    9 => "奥出雲町",
    10 => "飯南町",
    11 => "川本町",
    12 => "美郷町",
    13 => "邑南町",
    14 => "津和野町",
    15 => "吉賀町",
    16 => "海士町",
    17 => "西ノ島町",
    18 => "知夫村",
    19 => "隠岐の島町"
  }.freeze

  def municipality_name
    MUNICIPALITIES[municipality_id]
  end

  # JSONなどで画像URLを渡すためのヘルパー
  def image_url
    return nil unless image.attached?
    Rails.application.routes.url_helpers.rails_blob_url(image, only_path: true)
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :missions, dependent: :destroy
  has_many :payments, dependent: :destroy

  # 画像添付（Active Storage）
  has_one_attached :image
end
