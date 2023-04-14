class Product < ApplicationRecord
  has_many :filter, dependent: :destroy
  has_one_attached :photo

end
