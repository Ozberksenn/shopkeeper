const pool = require("../../db/db.connection");

const menu = (req, res) => {
  const query = "SELECT * FROM menu";
  pool.query(query, (error, result) => {
    if (error) {
      return res.status(400).json({
        statusCode: res.statusCode,
        message: "Error",
      });
    } else {
      return res.status(200).json({
        statusCode: res.statusCode,
        message: "Success",
        data: result.rows,
      });
    }
  });
};

module.exports = { menu };
