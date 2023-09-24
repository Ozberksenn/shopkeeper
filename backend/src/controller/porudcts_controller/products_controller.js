const pool = require("../../db/db.connection");

const products = (req, res) => {
  const query =
    "SELECT * FROM products INNER JOIN menu ON menu.menu_id = products.menu_id";
  pool.query(query, (error, result) => {
    if (error) {
      res.status(400).json({
        messages: "İşlem başarısız oldu.",
        error: error,
      });
    } else {
      res.status(200).json({
        messages: "İşlem başarılı",
        data: result.rows,
      });
    }
  });
};

const newProduct = (req, res) => {
  const { product_name, product_image, product_price, product_info, menu_id } =
    req.body;
  const query =
    'INSERT INTO "products" (product_name, product_image, product_price, product_info, menu_id) VALUES ($1, $2, $3, $4, $5)';
  const values = [
    product_name,
    product_image,
    product_price,
    product_info,
    menu_id,
  ];
  pool.query(query, values, (error, result) => {
    if (error) {
      res.status(400).json({
        messages: "Kayıt Hatalı",
        data: error,
      });
    } else {
      res.status(201).json({
        messages: "Kayıt Başarılı",
        data: values,
      });
    }
  });
};

module.exports = { products, newProduct };
