class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

<<<<<<< HEAD
  enum status:{有効: 0,退会: 1}
  def active_for_authentication?
    super && (self.status == "有効")
  end
=======
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
>>>>>>> a9ace58fd8f0a0dae1afc4a0abac86f37919b9b8
end

