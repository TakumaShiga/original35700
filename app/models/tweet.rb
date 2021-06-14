class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many_attached :images

  validates :text, presence: true #unless: :was_attached?

  # def was_attached?
  #   self.images.attached?
  # end

  def self.search(search)
    if search != ""
      Tweet.where('text LIKE(?)', "%#{search}%") 
    else
      Tweet.all
    end
  end
end
