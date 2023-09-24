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

const addNewMenu = (req, res) => {
  const { menu_name } = req.body;
  const query = 'INSERT INTO "menu" (menu_name) VALUES ($1)';
  const values = [menu_name];
  pool.query(query, values, (error, result) => {
    if (error) {
      return res.status(400).json({
        message: "Error",
        data: error,
      });
    } else {
      return res.status(201).json({
        message: "menu tablosuna kayıt başarıyla eklendi.",
        data: values,
      });
    }
  });
};

const updateMenu = (req, res) => {
  const { menu_id, menu_name } = req.body;
  const query = "UPDATE menu SET menu_name = $1 WHERE menu_id = $2";
  const values = [menu_name, menu_id];
  pool.query(query, values, (error, result) => {
    if (error) {
      res.status(400).json({
        message: "Error",
        data: error,
      });
    } else {
      res.status(200).json({
        data: "Success",
        message: values,
      });
    }
  });
};

const deleteMenu = (req, res) => {
  const { menu_id } = req.body;
  const query = "DELETE FROM menu WHERE menu_id = $1";
  const values = [menu_id];
  pool.query(query, values, (error, values) => {
    if (error) {
      res.status(400).json({
        message: "Error",
        data: error,
      });
    } else {
      res.status(200).json({
        message: "Success Deleted",
        data: values,
      });
    }
  });
};

module.exports = { menu, addNewMenu, updateMenu, deleteMenu };
