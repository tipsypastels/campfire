class CampfireChannel < ApplicationCable::Channel
  def subscribed
    stream_from "campfire_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    MessageBuilder.new(data).to_message!
  end

  def set_name(data)
    UsernameChanger.new(data).change!
  end
end
