json.user do
  json.id    @user.id
  json.username @user.username
  json.email @user.email

  json.admin_id @user.admin ? @user.admin.id : nil
end