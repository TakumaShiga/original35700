class Question < ApplicationRecord
  
  validates :post, presence: true, length: { maximum: 300 }

  has_many :answers, dependent: :destroy
  belongs_to :user
end
