class Event < ApplicationRecord
  belongs_to :user
  has_many :registrations
  has_one_attached :image
end
