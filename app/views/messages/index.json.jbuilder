json.array! @messages do |message|
  json.body message.body
  json.image message.image.url
  json.user_name message.user.name
  json.date (message.created_at).to_s(:datetime)
  json.id message.id
end
