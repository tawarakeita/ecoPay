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
    # 支払いフォームの内容を受け取る
    @merchant = Merchant.find(payment_params[:merchant_id])
    amount = payment_params[:amount].to_i

    @payment = current_user.payments.new(payment_params)

    # 現在のポイント残高を算出
    current_points = PointTransaction.where(user: current_user)
      .sum("CASE WHEN transaction_type = 'earn' THEN amount WHEN transaction_type = 'use' THEN -amount ELSE 0 END")

    # 不正チェック
    if amount > current_points
      flash[:alert] = "ポイントが不足しています。"
      return redirect_to new_payment_path(merchant_id: @merchant.id)
    end

    if amount > 5000
      flash[:alert] = "1回の決済で利用できるのは最大5000ポイントです。"
      return redirect_to new_payment_path(merchant_id: @merchant.id)
    end

    respond_to do |format|
      if @payment.save
        # 支払い完了時にポイント利用履歴を追加
        PointTransaction.create!(
          user: current_user,
          merchant: @merchant,
          transaction_type: "use",
          amount: amount,
          description: "#{@merchant.name} での支払い"
        )

        format.html { redirect_to @payment, notice: "支払いが完了しました！ #{amount}ポイントを利用しました。" }
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
      params.require(:payment).permit(:merchant_id, :amount)
    end
end
