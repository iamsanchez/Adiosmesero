json.array!(@clients) do |client|
  json.extract! client, :id, :Name, :ISV, :Total
  json.url client_url(client, format: :json)
end
