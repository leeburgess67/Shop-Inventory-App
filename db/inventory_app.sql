DROP TABLE products;
DROP TABLE suppliers;


CREATE TABLE suppliers (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255),
  phone VARCHAR(255)
);

CREATE TABLE products (
  id SERIAL4 PRIMARY KEY,
  description VARCHAR(255),
  cost_price INT4,
  retail_price INT4,
  item_markup INT4,
  bookstock INT2,
  supplier_id INT4 REFERENCES suppliers(id) ON DELETE CASCADE,
  upn INT4
);
