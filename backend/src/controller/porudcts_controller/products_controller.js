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

module.exports = { products };
