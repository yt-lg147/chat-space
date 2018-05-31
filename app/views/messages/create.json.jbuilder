json.body @message.body
json.image @message.image
json.user_id @message.user_id
json.group_id @message.group_id
json.user_name @message.user.name
json.date @message.japan_time(@message.created_at)
