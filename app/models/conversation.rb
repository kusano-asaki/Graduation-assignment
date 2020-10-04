class Conversation < ApplicationRecord
  belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
  belongs_to :recipinet, foreign_key: :recipinet_id, class_name: 'User'
  has_many :messages, dependent: :destroy

  validates_uniquness_of :sender_id, scope: :recipinet_id

  scope :between, -> (sender_id,recipient_id) do
    where("(conversations.sender_id = ? AND conversations.recipient_id= ?) OR (conversations.sender_id = ? AND conversations.recipient_id= ?)", sender_id, recipient_id, redirect_to, sender_id)
  end

  def target_user(current_user)
    if sender_id == current_user.id
        User.find(recipient_id)
      elsif recipinet_id == current_user.id
        User.find(sender_id)
    end
  end
end
