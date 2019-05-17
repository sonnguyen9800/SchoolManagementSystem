module CoordinatorsHelper
  def gravatar_for(coordinator)
    if coordinator != nil
    gravatar_id = Digest::MD5::hexdigest(coordinator.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: coordinator.name, class: "gravatar")
    else
    gravatar_id = Digest::MD5::hexdigest("example@railstutorial.org".downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: "Name", class: "gravatar")
    end
  end
end
