10.times do
  Item.create(
    title: Faker::Commerce.product_name,
    inventory: Faker::Number.number(2),
    price: Faker::Number.number(4)
  )
  Category.create(title: Faker::Commerce.department)
end

counter = 1
Item.all.each do |item|
  item.category_id = counter
  item.save
  counter += 1
end

User.create(
  name: "Albert",
  email: "birdcage123@aol.com",
  password: "iluvarmand",
)

User.create(
  name: "Brenda",
  email: "unhhhhh@gmail.com",
  password: "trixiekatya696969",
)

@cart = Cart.create(
  user_id: 3
)

@cart2 = Cart.create(
  user_id: 2
)

@item = Item.first
@line_item = @item.line_items.create(quantity: 1, cart: @cart2)
@second_item = Item.second
@second_line_item = @cart2.add_item(@second_item.id)
