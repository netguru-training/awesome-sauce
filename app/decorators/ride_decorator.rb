class RideDecorator < Draper::Decorator
  delegate_all

  def start_date
    object.start_date.strftime('%d-%m-%Y at %H:%M')
  end
end
