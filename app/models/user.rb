class User < ApplicationRecord
    has_secure_password
    has_many :gossips
    belongs_to :city, optional: true

    has_many :sent_messages, foreign_key: 'sender_id', class_name: 'PrivateMessage'
    has_many :received_messages, foreign_key: 'recipient_id', class_name: 'PrivateMessage'

    has_many :comments, foreign_key: 'author_id', class_name: 'Comment'
    has_many :likes
    validates :password, presence: true, length: { minimum: 4 }
end
