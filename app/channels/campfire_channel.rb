class CampfireChannel < ApplicationCable::Channel
  def subscribed
    stream_from "campfire_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Message.create!(
      content: data['content'],
      username: data['username'],
      color: data['color'],
    )
  end
end
