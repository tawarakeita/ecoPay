class MissionsController < ApplicationController
  before_action :set_mission, only: %i[ show edit update destroy ]
  before_action :authenticate_mission_admin!, except: [:index, :show, :complete_via_url]
  before_action :authenticate_user!, only: [:complete_via_url]

  # GET /missions or /missions.json
  def index
    @missions = Mission.all
  end

  # GET /missions/1 or /missions/1.json
  def show
  end

  # GET /missions/new
  def new
    if merchant_signed_in?
      @mission = current_merchant.missions.new
    else
      @mission = Mission.new
    end
  end

  # GET /missions/1/edit
  def edit
  end

  # POST /missions or /missions.json
  def create
    @mission = Mission.new(mission_params)

    respond_to do |format|
      if @mission.save
        format.html { redirect_to @mission, notice: "Mission was successfully created." }
        format.json { render :show, status: :created, location: @mission }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /missions/1 or /missions/1.json
  def update
    respond_to do |format|
      if @mission.update(mission_params)
        format.html { redirect_to @mission, notice: "Mission was successfully updated." }
        format.json { render :show, status: :ok, location: @mission }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /missions/1 or /missions/1.json
  def destroy
    @mission.destroy!

    respond_to do |format|
      format.html { redirect_to missions_path, status: :see_other, notice: "Mission was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # GET /missions/complete
  def complete_via_url
    if request.get?
      code = params[:code]
      if code.present?
        mission = Mission.find_by(unique_code: code)
        if mission
          render :confirm_complete, locals: { mission: mission, code: code }
        else
          redirect_to root_path, alert: "無効なコードです"
        end
      else
        render :complete_via_url
      end
    elsif request.post?
      code = params[:code]
      mission = Mission.find_by(unique_code: code)
      Rails.logger.debug "POST: code=#{code}, mission=#{mission.inspect}"
      if mission
        render :confirm_complete, locals: { mission: mission, code: code }
      else
        redirect_to root_path, alert: "無効なコードです"
      end
    end
  end

  def finalize_complete
    code = params[:code]
    mission = Mission.find_by(unique_code: code)

    if mission
      recent = PointTransaction.where(
        user: current_user,
        mission: mission,
        transaction_type: "earn"
      ).where("created_at >= ?", 1.hour.ago).exists?

      if recent
        redirect_to scanqrcode_path, alert: "このミッションは1時間以内にクリア済みです。"
        return
      end

      merchant = nil
      if mission.respond_to?(:merchant_id) && mission.merchant_id.present?
        merchant = Merchant.find_by(id: mission.merchant_id)
      end

      PointTransaction.create!(
        user: current_user,
        merchant: merchant,
        mission: mission,
        transaction_type: "earn",
        amount: mission.point,
        description: "ミッションクリア: #{mission.title}"
      )

      redirect_to root_path, notice: "ミッションを完了しました！#{mission.point}ポイントを付与されました！"
    else
      redirect_to root_path, alert: "無効なコードです"
    end
  end

  private
    def set_mission
      @mission = Mission.find(params[:id])
    end

    def mission_params
      params.require(:mission).permit(:merchant_id, :title, :description, :point)
    end
end
