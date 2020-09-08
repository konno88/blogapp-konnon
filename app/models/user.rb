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
