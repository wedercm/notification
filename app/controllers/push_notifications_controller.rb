class PushNotificationsController < ApplicationController
  def create
    # web = Webpush.payload_send(
    #   endpoint: "https://android.googleapis.com/gcm/send/ceE3Pipin4U:APA91bECjYXXtQatbOeman5A6oCEqdvvnktuRxm8ivya7CpEdsjnp0xboWYkaBlwE7eHFd1W2tAvo8Wsb-ykQ66Zx5G3MKY9m3TbQhSrtFr4hXD4MV-Abi0eWvkHmQpU-l-E32wEVGdu",
    #   p256dh: "BBpqVZhmps9Z2ujCgr5SHoEaJAidjYSWb5ILzwgPbdZXHmu74NCYp92VKTfPq01KFJBmAhcVUJy7NGjJlG_ORV8=",
    #   message: JSON.generate(message),
    #   ttl: 600,
    #   auth: "JS2hAo8Gat5_MqWqC8obag==",
    #   api_key: "AIzaSyBYjouWTc8NwzL0peLdiK4H-BsgQEvflgQ" # optional, not used in Firefox.
    # )
    Webpush.payload_send webpush_params
  end

  private

  def message 
    {
      title: "Notificação Maha.",
      body: "Você possui tarefas atrasadas"
    }
  end

  def webpush_params
    subscription = session.fetch(:subscription)
    endpoint = subscription["endpoint"]
    p256dh = subscription["keys"]["p256dh"]
    auth = subscription["keys"]["auth"]

    {
      endpoint: endpoint,
      p256dh: p256dh,
      message: JSON.generate(message),
      ttl: 600,
      auth: auth,
      api_key: "AIzaSyBYjouWTc8NwzL0peLdiK4H-BsgQEvflgQ" # optional, not used in Firefox.
    }
  end
end



