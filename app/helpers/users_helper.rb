module UsersHelper
  def gravatar_for(user, options = { :size => 50 })
    gravatar_image_tag(user.email.downcase, :alt => h(user.name),
                                            :class => 'gravatar',
                                            :gravatar => options)
  end

  def avatar_for(user)
        if user.avatar_file_name != nil
             image_tag user.avatar.url(:thumb)
        end
  end

end

