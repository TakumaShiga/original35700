class Question < ApplicationRecord
  validates :post, presence: true

  has_many :answers, dependent: :destroy
  belongs_to :user
end
