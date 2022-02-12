class WebpushNotification < ApplicationRecord
  def send_notification(message)
    Webpush.payload_send(
      endpoint: endpoint,
      message: message,
      p256dh: p256dh_key,
      auth: auth_key,
      vapid: {
        public_key: Rails.application.credentials.dig(:webpush, :public_key),
        private_key: Rails.application.credentials.dig(:webpush, :private_key)
      }
    )
  end
end
