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

const updateProduct = (req, res) => {
  const {
    product_name,
    product_image,
    product_price,
    product_info,
    menu_id,
    product_id,
  } = req.body;
  const query =
    "UPDATE products SET product_name = $1, product_image = $2, product_price = $3, product_info = $4, menu_id = $5 WHERE product_id = $6";
  const values = [
    product_name,
    product_image,
    product_price,
    product_info,
    menu_id,
    product_id,
  ];
  pool.query(query, values, (error, result) => {
    if (error) {
      res.status(400).json({
        messages: "Error",
        data: error,
      });
    } else {
      res.status(200).json({
        messages: "Success",
        data: values,
      });
    }
  });
};

const deleteProduct = (req, res) => {
  const { product_id } = req.body;
  const query = "DELETE FROM products WHERE product_id = $1";
  const values = [product_id];
  pool.query(query, values, (error, result) => {
    if (error) {
      res.status(400).json({
        messages: "Error Delete Product",
        data: error,
      });
    } else {
      res.status(200).json({
        messages: "Success",
        data: values,
      });
    }
  });
};

module.exports = { products, newProduct, updateProduct, deleteProduct };
