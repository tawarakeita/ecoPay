class MerchantSearchController < ApplicationController
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

  def index
    existing_ids = Merchant.distinct.pluck(:municipality_id)
    @municipality_options = existing_ids.map { |id| [MUNICIPALITIES[id], id] }

    if params[:municipality_id].present?
      municipality_id = params[:municipality_id].to_i
      @merchants = Merchant.where(municipality_id: municipality_id)
    else
      @merchants = Merchant.all
    end

    # Turbo Frameのリクエストかどうかを判定
    if turbo_frame_request?
      render partial: "merchant_search/municipality_mode",
             locals: { merchants: @merchants, municipality_options: @municipality_options },
             layout: false
    else
      respond_to do |format|
        format.html
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            "merchant-results",
            partial: "merchant_search/municipality_mode",
            locals: { merchants: @merchants, municipality_options: @municipality_options }
          )
        end
      end
    end
  end

  def map_mode
    render partial: "map_mode"
  end

  def municipality_mode
    render partial: "municipality_mode"
  end
end
