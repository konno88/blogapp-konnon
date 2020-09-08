class Article < ApplicationRecord

    validates :title, presence: true
    validates :title, length: {minimum: 2, maximum: 100}
    validates :title, format: {with: /\A(?!\@)/}
    validates :content, presence: true

    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_one_attached :eyecatch
    has_rich_text :content

    belongs_to :user

    def author_name
        user.display_name
    end

    def display_created_at
        I18n.l(self.created_at, format: :default)
    end

    def like_count
        likes.count
    end
end
