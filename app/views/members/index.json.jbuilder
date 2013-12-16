json.array!(@members) do |member|
  json.extract! member, :id, :name, :sex, :tel, :email, :saler_id
  json.url member_url(member, format: :json)
end
