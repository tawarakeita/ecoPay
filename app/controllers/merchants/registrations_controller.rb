class Merchants::RegistrationsController < Devise::RegistrationsController
  private

  # サインアップ時に追加カラムを許可
  def sign_up_params
    params.require(:merchant).permit(
      :email, :password, :password_confirmation,
      :name, :description, :address, :latitude, :longitude
    )
  end

  # アカウント更新時に追加カラムを許可
  def account_update_params
    params.require(:merchant).permit(
      :email, :password, :password_confirmation, :current_password,
      :name, :description, :address, :latitude, :longitude
    )
  end
end
