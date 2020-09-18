class CreateDiscounts < ActiveRecord::Migration[5.2]
  def change
    create_table :discounts do |t|
      t.string :name
      t.integer :quantity
      t.integer :percentage
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
