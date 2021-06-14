class RegistrationAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :place_number, :building_name, :phone_number, :user_id, :event_id, :token
  
  with_options presence: true do
    validates :user_id
    validates :event_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "はハイフンを含む半角数字で入力してください"}
    validates :city
    validates :place_number
    validates :token
    with_options numericality: true do
      validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "は10桁もしくは11桁で入力してください"}
    end
  end

  validates :prefecture_id, numericality: {other_than: 1, message: "を選択してください"}

 
  
   

    def save
      registration = Registration.create(user_id: user_id, event_id: event_id)
      Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, place_number: place_number, building_name: building_name, phone_number: phone_number, registration_id: registration.id )
    end

end


