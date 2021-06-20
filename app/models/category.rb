class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'ランニング練習会' },
    { id: 3, name: '1km' },
    { id: 4, name: '3km' },
    { id: 5, name: '5km' },
    { id: 7, name: '10km' },
    { id: 8, name: 'ハーフ(21km)' },
    { id: 9, name: 'フルマラソン(42km)' }
  ]

  include ActiveHash::Associations
  has_many :events
end
