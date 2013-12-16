json.array!(@products) do |product|
  json.extract! product, :id, :code, :name, :price, :status, :description
  json.url product_url(product, format: :json)
end
