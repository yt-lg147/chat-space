json.body @message.body
json.image @message.image.url
json.user_name @message.user.name
json.date @message.japan_time(@message.created_at)
