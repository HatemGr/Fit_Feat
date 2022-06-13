json.extract! event, :id, :admin_id, :sport_id, :city_id, :title, :description, :date, :address, :longitude, :latitude, :created_at, :updated_at
json.url event_url(event, format: :json)
