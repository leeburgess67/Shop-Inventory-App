require_relative( "../models/product.rb" )
require_relative( "../models/supplier.rb" )
require("pry")

Product.delete_all()
Supplier.delete_all()

supplier1 = Supplier.new({
  "name" => "Fender UK",
  "email" => "sales@fender.co.uk",
  "phone" => "01311346542"
})
supplier2 = Supplier.new({
  "name" => "Gibson",
  "email" => "sales@gibson.com",
  "phone" => "01414927593"
})
supplier3 = Supplier.new({
  "name" => "Yamaha",
  "email" => "admin@yamaha.co.uk",
  "phone" => "01317683773"
})
supplier4 = Supplier.new({
  "name" => "Ibanez",
  "email" => "wholesale@ibanez-guitars.co.uk",
  "phone" => "080022443322"
})
supplier5 = Supplier.new({
  "name" => "Jackson",
  "email" => "sales@jackson-guitars.co.uk",
  "phone" => "019834857305"
})
supplier6 = Supplier.new({
  "name" => "PRS",
  "email" => "sales@prs.co.uk",
  "phone" => "014194837473"
})

supplier1.save
supplier2.save
supplier3.save
supplier4.save
supplier5.save
supplier6.save


product1 = Product.new({
  "description" => "Gibson Les Paul Standard",
  "cost_price" => 1000,
  "retail_price" => 1599,
  "bookstock" => 3,
  "supplier_id" => supplier2.id,
  "upn" => 50321
  })
product2 = Product.new({
  "description" => "Fender Telecaster Deluxe",
  "cost_price" => 350,
  "retail_price" => 559,
  "bookstock" => 1,
  "supplier_id" => supplier1.id,
  "upn" => 50847
  })
product3 = Product.new({
  "description" => "Yamaha Acoustic",
  "cost_price" => 375,
  "retail_price" => 569,
  "bookstock" => 5,
  "supplier_id" => supplier3.id,
  "upn" => 50443
  })
product4 = Product.new({
  "description" => "Ibanez Artcore",
  "cost_price" => 250,
  "retail_price" => 499,
  "bookstock" => 1,
  "supplier_id" => supplier4.id,
  "upn" => 50887
  })
product5 = Product.new({
  "description" => "Gibson SG",
  "cost_price" => 500,
  "retail_price" => 799,
  "bookstock" => 2,
  "supplier_id" => supplier5.id,
  "upn" => 50221
  })
product6= Product.new({
  "description" => "Jackson Dinky",
  "cost_price" => 650,
  "retail_price" => 899,
  "bookstock" => 1,
  "supplier_id" => supplier5.id,
  "upn" => 50765
  })
product7= Product.new({
  "description" => "Ibanez Steve-Vai Signature",
  "cost_price" => 1050,
  "retail_price" => 1499,
  "bookstock" => 4,
  "supplier_id" => supplier5.id,
  "upn" => 50765
  })
product8= Product.new({
  "description" => "Fender American Special Stratocaster",
  "cost_price" => 678,
  "retail_price" => 899,
  "bookstock" => 3,
  "supplier_id" => supplier1.id,
  "upn" => 50765
  })
product9= Product.new({
  "description" => "Epiphone Les Paul Standard",
  "cost_price" => 250,
  "retail_price" => 399,
  "bookstock" => 5,
  "supplier_id" => supplier1.id,
  "upn" => 50765
  })
product10= Product.new({
  "description" => "PRS Mark Holcomb SE",
  "cost_price" => 589,
  "retail_price" => 699,
  "bookstock" => 1,
  "supplier_id" => supplier1.id,
  "upn" => 50765
  })

product1.save
product2.save
product3.save
product4.save
product5.save
product6.save
product7.save
product8.save
product9.save
product10.save
