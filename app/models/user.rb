class User < ApplicationRecord

  has_many :orders, :dependent => :destroy
  has_many :platos, through: :orders
  has_many :ingredientes, through: :orders
  has_many :billings

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  geocoded_by :address
  after_validation :geocode

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
    end
  end
  validates :email, uniqueness: true
  validates :password, presence: true
end
