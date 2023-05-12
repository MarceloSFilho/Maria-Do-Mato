class Product < ApplicationRecord
  has_many :filter, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one_attached :photo
  monetize :price_cents

  include PgSearch::Model

  pg_search_scope :search_by_products,
    against: [ :name ],
    using: {
      tsearch: { prefix: true }
    }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
end
