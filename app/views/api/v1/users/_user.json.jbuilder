json.(user, :id, :email, :first_name, :last_name)
json.token user.jwt_token
