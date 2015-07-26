class UserDecorator < Draper::Decorator
  delegate_all

  def reviewable?(current_user)
    RidesPassenger.was_his_passenger?(current_user, object)
  end

  def reviewed?(current_user)
    Review.where(author_id: current_user.id, user_id: id).any?
  end
end
