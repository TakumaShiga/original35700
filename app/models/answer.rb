class Answer < ApplicationRecord
  validates :message, presence: true

  belongs_to :question
  belongs_to :user

end
