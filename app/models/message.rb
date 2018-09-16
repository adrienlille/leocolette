class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user
  validates_presence_of :body, :conversation_id, :user_id

 def full_time
  created_at.strftime("%m/%d/%y at %l:%M %p")
 end

 def date
  created_at.strftime("%d/%m/%y")
 end

 def time
  created_at.strftime("%l:%M %p")
 end

 def readclass
  if self.read == true
    return 'oldMessage'
  else
    return 'recentMessage'
  end
 end
end
