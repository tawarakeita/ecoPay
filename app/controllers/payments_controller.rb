class PaymentsController < ApplicationController
  before_action :set_payment, only: %i[ show edit update destroy ]

  # GET /payments or /payments.json
  def index
    if merchant_signed_in?
      @payments = current_merchant.payments
    else
      redirect_to root_path
    end
  end

  # GET /payments/1 or /payments/1.json
  def show
    if @payment.created_at < 5.minutes.ago
      redirect_to root_path, alert: "確認画面の有効期限が切れました"
    end
  end

  def new
    @payment = Payment.new

    if params[:merchant_id].present?
      @merchant = Merchant.find_by(id: params[:merchant_id])

      unless @merchant
        redirect_to root_path, alert: "指定された協賛店が見つかりません。"
      end
    end
  end


  # GET /payments/1/edit
  def edit
  end

  # POST /payments or /payments.json
  def create
    @payment = current_user.payments.new(payment_params)

    respond_to do |format|
      if @payment.save
        format.html { redirect_to @payment, notice: "Payment was successfully created." }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payments/1 or /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to @payment, notice: "Payment was successfully updated." }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1 or /payments/1.json
  def destroy
    @payment.destroy!

    respond_to do |format|
      format.html { redirect_to payments_path, status: :see_other, notice: "Payment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def payment_params
      params.require(:payment).permit(:user_id, :merchant_id, :amount)
    end
end
