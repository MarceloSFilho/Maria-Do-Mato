class CreateFilters < ActiveRecord::Migration[7.0]
  def change
    create_table :filters do |t|
      t.string :category
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
