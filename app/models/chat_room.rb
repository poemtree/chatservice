class ChatRoom < ActiveRecord::Base
  # chat 1:N
  has_many :chats
  # user M:N, admission
  has_many :users, through: :admissions
  has_many :admissions, dependent: :destroy

  after_commit :create_chat_room_notification, on: :create
  after_commit :destroy_chat_room_notification, on: :destroy

  def create_chat_room_notification
    # Psher.trigger(channel, eventm, info)
    Pusher.trigger('chat_room', 'create', self.as_json)
  end

  def destroy_chat_room_notification
    Pusher.trigger('chat_room', 'destroy', self.as_json)
    Pusher.trigger("chat_room_#{self.id}", 'destroy', {})
  end
end
