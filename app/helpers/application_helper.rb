module ApplicationHelper
  def avatar_for(user, size = 30, title = user.username)
    image_tag user.avatar.url, title: title, class: 'img-rounded', size: size
  end
end
