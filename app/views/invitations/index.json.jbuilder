json.array!(@invitations) do |invitation|
  json.extract! invitation, :id, :email, :user_id, :invitation_date, :purpose, :qr_code_url
  json.url invitation_url(invitation, format: :json)
end
