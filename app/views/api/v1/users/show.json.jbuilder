json.user do
  json.id    @user.id
  json.username @user.username
  json.email @user.email
  json.authentication_token @user.authentication_token

  json.admin_id @user.admin ? @user.admin.id : nil
end
