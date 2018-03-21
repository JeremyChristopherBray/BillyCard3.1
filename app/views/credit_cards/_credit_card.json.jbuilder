json.extract! credit_card, :id, :card_name, :card_providor, :interest_rate, :balance, :created_at, :updated_at
json.url credit_card_url(credit_card, format: :json)
