# json.content format_content(@message.content)
# json.(@message, :created_at, :updated_at)

# json.author do
#   json.name @message.creator.name.familiar
#   json.email_address @message.creator.email_address_with_name
#   json.url url_for(@message.creator, format: :json)
# end

# if current_user.admin?
#   json.visitors calculate_visitors(@message)
# end

# json.comments @message.comments, :content, :created_at

# json.attachments @message.attachments do |attachment|
#   json.filename attachment.filename
#   json.url url_for(attachment)
# end

json.post do
  json.id @post.id
  json.body @post.body
  json.status @post.status
  json.title @post.title
  json.user_id @post.user_id
  json.likes_count @post.likes.count
end

json.comments @post.comments do |comment|
  json.id comment.id
  json.body comment.body
  json.post_id comment.post_id
  json.user_id comment.user_id

  json.likes_count comment.likes.count
end


