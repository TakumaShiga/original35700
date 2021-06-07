class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
 validates_format_of :password, with: PASSWORD_REGEX, message: 'は6文字以上の英字と数字の両方を含めて設定してください'       
       
 with_options presence: true do
  validates :nickname
  validates :gender
  validates :birth_day
 end
       
 has_many :tweets
 has_many :comments
 has_many :likes
 has_one_attached :image

 has_many :active_relationships, class_name: 'Follow', foreign_key: 'user_id'
 has_many :passive_relationships, class_name: 'Follow', foreign_key: 'target_user_id'
 has_many :followings, through: :active_relationships, source: :target_user
 has_many :followers, through: :passive_relationships, source: :user
         
 validates :full_name, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'は全角(ひらがな、カタカナ、漢字)で入力してください'}
 validates :email, uniqueness: true   
 
 def already_liked?(tweet)
   self.likes.exists?(tweet_id: tweet.id)
 end

end
