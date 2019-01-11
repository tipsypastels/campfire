class Message < ApplicationRecord
  default_scope do
    order created_at: :desc
  end

  after_create_commit do
    BroadcastMessageJob.perform_later(self)
  end

  validates :content, :username, :color, 
    presence: true

  def system_message?
    username == system
  end
end
