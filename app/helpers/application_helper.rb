module ApplicationHelper
  def linkify_the_username(body)
    body.gsub(/@\w+/) do |username| 
      username = username.tr('@', '')
    #  if User.all.pluck(:username).map.include?(username)
      
      if User.find_by(username: username)
        link_to "@#{username}", user_path(username)
      else
        '@' + username
      end
    end

    body.gsub(/#\w+/) do |hashtag|
      hashtag = hashtag.tr('#', '')
      link_to "##{hashtag}", search_path(hashtag)
    end

     # if result.tr('@', '') == current_user.username
      #else
       # "<strong>#{result}</strong>"
     # end
   # end
  end
end
