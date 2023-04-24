class Filter < ApplicationRecord
  belongs_to :product

  CATEGORYS = [
    "Macramê",
    "Vela",
    "Cerâmica" ]

    validates :category, uniqueness: {scope: :product}
    validate :less_than_one

  def less_than_one
    if Category.where(product: product).count >= 1
      errors.add(:language, "Escolha apenas 1 linguagem")
    end
  end
end
