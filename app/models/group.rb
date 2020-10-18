class Group < ApplicationRecord
    has_many :user_groups, dependent: :destroy
    has_many :users, through: :user_groups
    has_many :posts, dependent: :destroy

    validates :group_name, presence: true
end
