module CoordinatorsHelper
  def gravatar_for(coordinator)
    gravatar_id = Digest::MD5::hexdigest(coordinator.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: coordinator.name, class: "gravatar")
  end
end
