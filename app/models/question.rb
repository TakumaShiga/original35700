class Question < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100 }
  validates :post, presence: true, length: { maximum: 600 }

  has_many :answers, dependent: :destroy
  belongs_to :user
end
