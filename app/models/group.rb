class Group < ApplicationRecord
    has_many :messages, dependent: :destroy
    has_many :entries, dependent: :destroy

    belongs_to :user
    validates :group_name, presence: true
end
