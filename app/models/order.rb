class Order < ApplicationRecord
  belongs_to :user
  belongs_to :plato
  belongs_to :billing, optional: true
end
