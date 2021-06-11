class Event < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture

  belongs_to :user
  has_many :registrations
  has_one_attached :image

  validates :fee, presence: true ,numericality: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください'}
  
  with_options presence: true do
    validates :event_name
    validates :event_date
    validates :start_time
    validates :finish_time
    validates :place_number
    validates :place_name
    validates :deadline
    validates :description
  
    with_options numericality: { other_than: 1, message: 'を選択してください'} do
      validates :category_id
      validates :prefecture_id
    end
  end


end
