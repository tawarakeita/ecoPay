class MissionsController < ApplicationController
  before_action :set_mission, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:complete_via_url]

  # GET /missions or /missions.json
  def index
    if merchant_signed_in?
      @missions = current_merchant.missions
    else
      @missions = Mission.all
    end
  end

  # GET /missions/1 or /missions/1.json
  def show
  end

  # GET /missions/new
  def new
    if merchant_signed_in?
      @mission = Mission.new
    else
      redirect_to missions_path
    end
  end

  # GET /missions/1/edit
  def edit
    if !merchant_signed_in?
      redirect_to missions_path
    end
  end

  # POST /missions or /missions.json
  def create
    @mission = current_merchant.missions.new(mission_params)

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

  def complete_via_url
    code = params[:code]
    mission = Mission.find_by(complete_code: code)

    if mission
      recent = PointTransaction.where(
        user: current_user,
        mission: mission,
        transaction_type: "earn"
      ).where("created_at >= ?", 1.hour.ago).exists?

      if recent
        redirect_to scanqrcode_path, alert: "このミッションは1時間以内にクリア済みです。しばらく待ってください。"
        return
      end

      PointTransaction.create!(
        user: current_user,
        merchant: mission.merchant,
        mission: mission,
        transaction_type: "earn",
        amount: mission.point,
        description: "ミッションクリア: #{mission.title}"
      )

      redirect_to root_path, notice: "ミッションを完了しました！#{mission.point}ポイントを付与しました！"
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
      params.require(:mission).permit(:merchant_id, :title, :description, :point)
    end
end
