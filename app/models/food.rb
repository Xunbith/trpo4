class Food < ApplicationRecord
    belongs_to :user
    has_many :orderables
    has_many :carts, through: :orderables
    validates :title, presence: true, length: {maximum: 25}
    validates :description, presence: true, length: {maximum: 1000}
    validates :price, presence: true, numericality: {greater_than: 0 }
    validates :location, presence: true, length: {maximum: 100}
end
