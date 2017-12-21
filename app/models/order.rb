class Order < ApplicationRecord
  has_many :line_items, :dependent => :destroy
  belongs_to :user
  belongs_to :plato
  belongs_to :billing, optional: true
  scope :cart, -> {where(payed: false)}

  geocoded_by :address
  after_validation :geocode

  scope :in_progress, ->{where("orders.checked_out_at IS NULL")}
  scope :complete, -> {where("orders.checked_out_at IS NOT NULL")}

  COMPLETE = "complete"
  IN_PROGRESS = "in_progress"

  def self.get_total
    where(nil).pluck("price * quantity").sum
  end

  def self.find_with_plato(plato)
    return [] unless plato
    complete.joins(:line_items).
        where(["line_items.plato_id = ?", plato.id]).
        order("orders.checked_out_at DESC")
  end

  def checkout!
    self.checked_out_at = Time.now
    self.save
  end

  def recalculate_price!
    self.total_price = line_items.inject(0.0){|sum, line_item| sum += line_item.price }
    save!
  end

  def state
    checked_out_at.nil? ? IN_PROGRESS : COMPLETE
  end

  def display_name
    ActionController::Base.helpers.number_to_currency(total_price) +
        " - Order ##{id} (#{user.username})"
  end

  def self.get_total
    pluck("price * quantity").sum
  end

end
