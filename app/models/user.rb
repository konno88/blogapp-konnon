class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :articles, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :favorites_articles, through: :likes, source: :article
  has_one :profile, dependent: :destroy
  has_many :following_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :followings, through: :following_relationships, source: :following
  has_many :follower_relationships, foreign_key: 'following_id', class_name: 'Relationship', dependent: :destroy
  has_many :followers, through: :follower_relationships, source: :follower
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :user_groups, dependent: :destroy
  has_many :groups, through: :user_groups
  has_many :posts, dependent: :destroy

  delegate :birthday, :age, :gender, :location, :musical_instrument, to: :profile, allow_nil: true

  
  def has_written?(article)
    articles.exists?(id: article.id)
  end

  def has_liked?(article)
    likes.exists?(article_id: article.id)
  end

  def display_name
    profile&.nickname || self.email.split('@').first
  end

  def avatar_image
    if profile&.avatar&.attached?
      profile.avatar
    else
      'default-icon.png'
    end
  end

  def prepare_profile
    profile || build_profile
  end

  def follow!(user)
    user_id = get_user_id(user)

    following_relationships.create!(following_id: user_id)
  end

  def unfollow!(user)
    user_id = get_user_id(user)

    relation = following_relationships.find_by!(following_id: user_id)
    relation.destroy!
  end

  def has_followed?(user)
    following_relationships.exists?(following_id: user.id)
  end

  def has_comment?(message)
    messages.exists?(id: message.id)
  end

  def has_post?(post)
    posts.exists?(id: post.id)
  end

  private
  def get_user_id(user)
    if user.is_a?(User)
      user.id
    else
      user
    end
  end
  
  protected
  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
       
    unless user
      user = User.create(
      name: data['name'],
      email: data['email'],
      password: Devise.friendly_token[0,20]
      )
    end
    user
  end
end
