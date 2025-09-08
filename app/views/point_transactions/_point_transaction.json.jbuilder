json.extract! point_transaction, :id, :user_id, :merchant_id, :transaction_type, :amount, :mission_id, :description, :created_at, :updated_at
json.url point_transaction_url(point_transaction, format: :json)
