module ApplicationHelper
  def user_keep_an_eye_on?(this)
    this.all?{ |tag| current_user.favourite_tags.include? tag }
  end

  def user_favourites
    Team.with_tags(current_user.favourite_tags).to_a +
    Game.with_tags(current_user.favourite_tags).to_a +
    Event.with_tags(current_user.favourite_tags).to_a
  end
end
