json.array!(@tenants) do |tenant|
  json.extract! tenant, :id, :name, :domain, :email
  json.url tenant_url(tenant, format: :json)
end
