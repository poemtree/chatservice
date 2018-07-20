class ChatRoom < ActiveRecord::Base
  # chat 1:N
  has_many :chats
  # user M:N, admission
  has_many :users, through: :admission
  has_many :admissions
end
