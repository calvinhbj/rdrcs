json.array!(@orders) do |order|
  json.extract! order, :id, :code, :mb_id, :pd_id, :order_status, :price, :pay_type, :pay_status, :service_status, :description
  json.url order_url(order, format: :json)
end
