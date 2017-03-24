class User < ActiveRecord::Base
  has_many :user_senders, class_name: 'Message', foreign_key: 'recipient_id'
  has_many :user_recipients, class_name: 'Message', foreign_key: 'sender_id'

  has_many :senders, class_name: 'User', through: 'user_senders'
  has_many :recipients, class_name: 'User', through: 'user_recipients'

  validates :name, :password, presence: true
  validates :name, length: { minimum: 2 }, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 7 }
end
