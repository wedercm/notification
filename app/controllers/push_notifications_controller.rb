class PushNotificationsController < ApplicationController
  def create
    Webpush.payload_send(
      endpoint: "https://android.googleapis.com/gcm/send/fElqemQBrZo:APA91bE5gBWx9A4OPiSu1UbdzjA7PLohYS0ANFrjE2y1usv2S-qJoTrlTlIV8cvviDGB7hSNhRPkQE-BAh7uBjHQs6f_ySTIw_IBVyF4w0XKr2k-zmK3F4wkPYmuPClFzd3RjQwyLG3v",
      p256dh: "BITaBfEbnuhmM5CEXTknaQVytxXYnIybHNxJauxTm6QP4ZEHHI0G-DuRKAJ3VlEe6ZBLKXuHaIFRQh-PqqR1W7M=",
      message: JSON.generate(message),
      ttl: 600,
      auth: "iyKAr43ZWlo_hKS5pmxHdg==",
      api_key: "AIzaSyBYjouWTc8NwzL0peLdiK4H-BsgQEvflgQ" # optional, not used in Firefox.
      )
    
  end

  private

  def message 
    {
      title: "Notificação Maha.",
      body: "Você possui tarefas atrasadas"
    }
  end
end



