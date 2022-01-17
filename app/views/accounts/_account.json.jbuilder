json.extract! account, :id, :balance, :pin, :account_number, :user_id, :account_type_id, :created_at, :updated_at
json.url account_url(account, format: :json)
