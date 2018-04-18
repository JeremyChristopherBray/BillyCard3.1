json.extract! loan, :id, :name, :description, :lengthInMonths, :amount, :created_at, :updated_at
json.url loan_url(loan, format: :json)
