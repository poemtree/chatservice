class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :chats
  has_many :admissions
  has_many :chat_rooms, through: :admissions

  def join_room?(chat_room)
    # Admission.where(user_id: self.id, chat_room_id: chat_room.id)
    self.chat_rooms.include?(chat_room)
  end
end
