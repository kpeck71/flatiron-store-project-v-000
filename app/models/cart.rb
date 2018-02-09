class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items


  def total #test in console
    prices = []
    self.line_items.each do |line_item|
      prices << line_item.item.price * line_item.quantity
    end
    prices.inject(:+)
  end

  def add_item(item_id)
    #Ask a Question - why is my quantity going up and not my price in my Line Item?
    line_item = self.line_items.find_by(item_id: item_id)
    if line_item
      line_item.quantity += 1
      line_item.save
    else
      line_item = self.line_items.build(item_id: item_id)
    end
    line_item
  end

  def checkout
    self.status = "submitted"
    update_inventory
    self.save
  end

  def update_inventory
    self.line_items.each do |line_item|
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
    end
  end

end
