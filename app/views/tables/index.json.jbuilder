json.array!(@tables) do |table|
  json.extract! table, :id, :used
  json.url table_url(table, format: :json)
end
