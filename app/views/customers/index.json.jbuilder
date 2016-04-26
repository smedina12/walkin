json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :lastname, :phone, :timein
  json.url customer_url(customer, format: :json)
end
