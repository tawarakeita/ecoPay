json.extract! payment, :id, :user_id, :merchant_id, :amount, :created_at, :updated_at
json.url payment_url(payment, format: :json)
