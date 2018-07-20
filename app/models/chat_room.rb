class ChatRoom < ActiveRecord::Base
  # chat 1:N
  has_many :chats
  # user M:N, admission
  has_many :users, through: :admissions
  has_many :admissions

  after_commit :create_chat_room_notification, on: :create

  def create_chat_room_notification
    # Psher.trigger(channel, eventm, info)
    Pusher.trigger('chat_room', 'create', self.as_json)
  end
end
