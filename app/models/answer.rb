class Answer < ApplicationRecord
  validates :message, presence: true, length: { maximum: 600 }

  belongs_to :question
  belongs_to :user

end
