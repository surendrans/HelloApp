json.array!(@company_users) do |company_user|
  json.extract! company_user, :id, :name, :email, :phone_number
  json.url company_user_url(company_user, format: :json)
end
