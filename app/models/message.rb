class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  belongs_to :group
  validates :content, presence: true
end
