class Orderable < ApplicationRecord
  belongs_to :food
  belongs_to :cart
  def total
    food.price * quantity
  end
end
