class PointTransactionsController < ApplicationController
  before_action :set_point_transaction, only: %i[ show edit update destroy ]

  # GET /point_transactions or /point_transactions.json
  def index
    @point_transactions = PointTransaction.all
  end

  # GET /point_transactions/1 or /point_transactions/1.json
  def show
  end

  # GET /point_transactions/new
  def new
    @point_transaction = PointTransaction.new
  end

  # GET /point_transactions/1/edit
  def edit
  end

  # POST /point_transactions or /point_transactions.json
  def create
    @point_transaction = PointTransaction.new(point_transaction_params)

    respond_to do |format|
      if @point_transaction.save
        format.html { redirect_to @point_transaction, notice: "Point transaction was successfully created." }
        format.json { render :show, status: :created, location: @point_transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @point_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /point_transactions/1 or /point_transactions/1.json
  def update
    respond_to do |format|
      if @point_transaction.update(point_transaction_params)
        format.html { redirect_to @point_transaction, notice: "Point transaction was successfully updated." }
        format.json { render :show, status: :ok, location: @point_transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @point_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /point_transactions/1 or /point_transactions/1.json
  def destroy
    @point_transaction.destroy!

    respond_to do |format|
      format.html { redirect_to point_transactions_path, status: :see_other, notice: "Point transaction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_point_transaction
      @point_transaction = PointTransaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def point_transaction_params
      params.require(:point_transaction).permit(:user_id, :merchant_id, :transaction_type, :amount, :mission_id, :description)
    end
end
