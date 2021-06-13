class Registration < ApplicationRecord
  
  belongs_to :user
  belongs_to :event
  has_one :address

  validates :event_id, uniqueness: { scope: :user_id }
end
