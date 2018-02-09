class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items

  def self.available_items
    Item.all.select{|i| i.inventory > 0 }
  end

  def priced
    self.price.to_f/100
  end

end
