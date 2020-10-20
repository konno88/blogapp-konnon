class Group < ApplicationRecord
    has_many :user_groups, dependent: :destroy
    has_many :users, through: :user_groups
    has_many :posts, dependent: :destroy

    validates :group_name, presence: true, length: {maximum: 30}

    scope :with_keywords, -> keywords {
        if keywords.present?
            columns = [:group_name]
            where(keywords.split(/[[:space:]]/).reject(&:empty?).map {|keyword|
                columns.map { |a| arel_table[a].matches("%#{keyword}") }.inject(:or)
            }.inject(:and))
        end
    }
end
