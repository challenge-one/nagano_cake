class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cart_items
  has_many :products, through: :cart_items

  validates :family_name, presence: true
  validates :family_rubi, presence: true
  validates :first_name, presence: true
  validates :first_rubi, presence: true
  validates :postcode, presence: true
  validates :address, presence: true
  validates :tell, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true

   enum status: {
   	true: 0,
   	false: 1
   },_prefix: true
end

