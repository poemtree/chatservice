class Admission < ActiveRecord::Base
  belongs_to :user
  belongs_to :chat_room, count_cache: true
end
