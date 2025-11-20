class MissionsController < ApplicationController
  before_action :set_mission, only: %i[ show edit update destroy ]
  # Allow merchants to access new/create so merchants can create missions.
  # mission_admin authentication still required for other management actions.
  before_action :authenticate_mission_admin!, except: [:index, :show, :new, :create, :complete_via_url, :finalize_complete]
  before_action :authenticate_user!, only: [:complete_via_url, :finalize_complete]

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
    elsif mission_admin_signed_in?
      @mission = current_mission_admin.missions.new
    end
  end

  # GET /missions/1/edit
  def edit
  end

  # POST /missions or /missions.json
  def create
    if merchant_signed_in?
      @mission = current_merchant.missions.new(mission_params)
    elsif mission_admin_signed_in?
      @mission = current_mission_admin.missions.new(mission_params)
    else
      @mission = Mission.new(mission_params)
    end

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

      PointTransaction.create!(
        user: current_user,
        merchant: nil,
        mission_admin: current_mission_admin,
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
    # Use callbacks to share common setup or constraints between actions.
    def set_mission
      @mission = Mission.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mission_params
      params.require(:mission).permit(:title, :description, :point)
    end
end
