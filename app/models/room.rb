class Room < ApplicationRecord
  has_many :users
  has_many :messages, dependent: :destroy

  validates :name, presence: true
end
