class Message < ActiveRecord::Base
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'

  validates :message, :sender, :recipient, presence: true
  validates :message, length: { minimum: 2 }

end
