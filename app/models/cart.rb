class Cart
  attr_reader :contents

  def initialize(contents)
    @contents = contents
  end

  def add_item(item)
    @contents[item] = 0 if !@contents[item]
    @contents[item] += 1
  end

  def total_items
    @contents.values.sum
  end

  def items
    item_quantity = {}
    @contents.each do |item_id,quantity|
      item_quantity[Item.find(item_id)] = quantity
    end
    item_quantity
  end

  def subtotal(item)
    sub = item.price * @contents[item.id.to_s]
    if discounts?(item)
      discount = Discount.where(item: item).where("quantity <= #{@contents["#{item.id}"]}").first
      sub - (sub * discount.percentage/100.to_f)
    else
      sub
    end
  end

  def total
    @contents.sum do |item_id,quantity|
      subtotal(Item.find(item_id))
    end
  end

  def add_quantity(item_id)
    @contents[item_id] += 1
  end

  def subtract_quantity(item_id)
    @contents[item_id] -= 1
  end

  def item_count(item_id)
    @contents[item_id.to_s]
  end

  def out_of_stock?(item_id)
    item_count(item_id) == Item.find(item_id).inventory
  end

  def modify(order)
    items.each do |item,quantity|
      item.modify_item_inventory(item, quantity, :decrease)
      order.item_orders.create({
        item: item,
        quantity: quantity,
        price: item.price,
        status: "unfulfilled"
        })
    end
  end

  def discounts?(item)
    Discount.where(item: item).where("quantity <= #{@contents["#{item.id}"]}").exists?
  end

end
