class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }, on: :create
  with_options presence: true do
    validates :nickname
    validates :gender
    validates :birth_day
  end

  has_many :tweets, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :questions
  has_many :answers
  has_many :events
  has_many :registrations
  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages
  has_one_attached :image

  has_many :active_relationships, class_name: 'Follow', foreign_key: 'user_id'
  has_many :passive_relationships, class_name: 'Follow', foreign_key: 'target_user_id'
  has_many :followings, through: :active_relationships, source: :target_user
  has_many :followers, through: :passive_relationships, source: :user

  has_many :sns_credentials

  validates :full_name, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'は全角(ひらがな、カタカナ、漢字)で入力してください' }

  def already_liked?(tweet)
    likes.exists?(tweet_id: tweet.id)
  end

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.nickname,
      email: auth.info.email
    )
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end
