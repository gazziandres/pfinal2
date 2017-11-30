class Order < ApplicationRecord
  belongs_to :user
  belongs_to :plato
  belongs_to :billing, optional: true
  scope :cart, -> {where(payed: false)}

  def self.get_total
    pluck("price * quantity").sum
  end

end
