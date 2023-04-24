class Product < ApplicationRecord
  has_many :filter, dependent: :destroy
  has_one_attached :photo


  monetize :price_cents

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
end
