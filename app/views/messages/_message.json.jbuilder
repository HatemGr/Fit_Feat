json.extract! message, :id, :object, :body, :sender_id, :recipient_id, :created_at, :updated_at
json.url message_url(message, format: :json)
