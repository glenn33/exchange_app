class PagesController < ApplicationController
  def home
    @exchange_rate = 0 #WesternUnionRequestService.call&.round(2)

  end

  def notification_create
    notification = WebpushNotification.find_by(auth_key: params[:keys][:auth])
    unless notification
      notification = WebpushNotification.new(
        endpoint: params[:endpoint],
        auth_key: params[:keys][:auth],
        p256dh_key: params[:keys][:p256dh],
      )
    end
    if notification.save
      render json: { data: notification }
    else
      render json: { error: notification.errors.full_messages }
    end
  end
end
