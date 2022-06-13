json.extract! city, :id, :name, :longitude, :latitude, :created_at, :updated_at
json.url city_url(city, format: :json)
