require_relative( "../models/product.rb" )
require_relative( "../models/supplier.rb" )
require("pry")

Product.delete_all()
Supplier.delete_all()

supplier1 = Supplier.new({
  "name" => "Cool Beanz Co",
  "email" => "coolbeanz@unilever.com",
  "phone" => "01311346542"
})
supplier2 = Supplier.new({
  "name" => "Alpha Wholesale",
  "email" => "alpha@wholesare.com",
  "phone" => "01414927593"
})
supplier3 = Supplier.new({
  "name" => "Hughson Brothers Co",
  "email" => "hbbros@wholesale.com",
  "phone" => "01317683773"
})
supplier4 = Supplier.new({
  "name" => "JW Fillshill",
  "email" => "JW@Fillshillwholesale.co.uk",
  "phone" => "07993857726"
})
supplier5 = Supplier.new({
  "name" => "Lynas",
  "email" => "lynasfoodservice@scotland.co.uk",
  "phone" => "07443556927"
})

supplier1.save
supplier2.save
supplier3.save
supplier4.save
supplier5.save


product1 = Product.new({
  "description" => "Heinz Baked Beans",
  "cost_price" => 45,
  "retail_price" => 75,
  "bookstock" => 25,
  "supplier_id" => supplier1.id
  })
product2 = Product.new({
  "description" => "Kwik Flakes",
  "cost_price" => 70,
  "retail_price" => 100,
  "bookstock" => 12,
  "supplier_id" => supplier2.id
  })
product3 = Product.new({
  "description" => "Chocco Delight Digestive Biscuits",
  "cost_price" => 63,
  "retail_price" => 80,
  "bookstock" => 5,
  "supplier_id" => supplier3.id
  })
product4 = Product.new({
  "description" => "Space invaders",
  "cost_price" => 8,
  "retail_price" => 20,
  "bookstock" => 67,
  "supplier_id" => supplier4.id
  })
product5 = Product.new({
  "description" => "80 Tetley Teabags",
  "cost_price" => 189,
  "retail_price" => 250,
  "bookstock" => 30,
  "supplier_id" => supplier5.id
  })
product6= Product.new({
  "description" => "Don't be Fusilli 300g - Pasta",
  "cost_price" => 40,
  "retail_price" => 99,
  "bookstock" => 12,
  "supplier_id" => supplier1.id
  })

product1.save
product2.save
product3.save
product4.save
product5.save
product6.save
