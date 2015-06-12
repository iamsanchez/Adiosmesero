json.array!(@tables) do |table|
  json.extract! table, :id, :state
  json.url table_url(table, format: :json)
end
