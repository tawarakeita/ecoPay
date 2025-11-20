class ApplicationController < ActionController::Base
  # ログインしていない場合、ユーザーログインのトップにリダイレクトする
  # Skip this check for Devise controllers so the login pages themselves are reachable.

  private

  def authenticate_any!
    return if mission_admin_signed_in? || merchant_signed_in? || user_signed_in?

    redirect_to new_user_session_path, alert: "ログインしてください"
  end
end
