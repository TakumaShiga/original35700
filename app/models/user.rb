class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   
  has_many :tweets       

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'  
  
  with_options presence: true do
    validates :nickname
    validates :gender
    validates :birth_day
  end

  validates :full_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'には全角(ひらがな、カタカナ、漢字)で入力してください' }
  validates :email, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
end
