class ItemOrder <ApplicationRecord
  validates_presence_of :item_id, :order_id, :price, :quantity, :status

  belongs_to :item
  belongs_to :order

  def subtotal
    total = price * quantity
    if discounts?
      discount = Discount.where(item_id: item_id).where("quantity <= #{quantity}").order(percentage: :desc).first
      total - (total * discount.percentage/100.to_f)
    else
      total
    end
  end

  def discounts?
    Discount.where(item_id: item_id).where("quantity <= #{quantity}").exists?
  end
end
