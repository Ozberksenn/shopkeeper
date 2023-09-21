const pool = require("../../db/db.connection");
const { createToken } = require("../../middlewares/auth");
const register = (req, res) => {
  const { userName, email, password } = req.body;
  const query =
    'INSERT INTO "users" (username, email, password) VALUES ($1, $2, $3)';
  const values = [userName, email, password];
  pool.query(query, values, (error, result) => {
    if (error) {
      res.status(400).json({
        messages: "kayıt gerçekleştirilemedi",
        error: error,
      });
      console.log(error);
    } else {
      res.status(201).json({
        messages: "Kayıt Başarılı",
        data: values,
      });
    }
  });
};

const login = (req, res) => {
  const { email, password } = req.body;
  const query = "SELECT * FROM users WHERE email = $1 AND password = $2";
  const values = [email, password];
  pool.query(query, values, (error, result) => {
    if (error) {
      res.status(400).json({
        message: "E posta or password is incorrect.",
        error: error,
      });
    } else {
      if (result.rows.length === 0) {
        res.status(400).json({
          message: "E posta or password is incorrect.",
        });
      } else {
        createToken(result.rows, res);
      }
    }
  });
};

const update = (req, res) => {
  const { name, password, user_id } = req.body;
  const query =
    "UPDATE users SET username = $1 , password = $2 WHERE user_id = $3";
  const values = [name, password, user_id];
  pool.query(query, values, (error, result) => {
    if (error) {
      res.status(400).json({
        message: "An error occurred while updating user",
        error: error,
      });
    } else {
      res.status(200).json({
        message: "User updated successfully",
        result: result,
      });
    }
  });
};

const deleteUser = (req, res) => {
  const { user_id } = req.body;
  console.log(user_id);
  const query = "DELETE FROM users WHERE user_id = $1 ";
  const values = [user_id];
  pool.query(query, values, (error, result) => {
    if (error) {
      res.status(400).json({
        statusCode: statusCode,
        message: "deletion failed",
      });
    } else {
      res.status(200).json({
        message: "deletion successful",
      });
    }
  });
};

const me = async (req, res) => {
  return res.status(200).json({
    statusCode: res.statusCode,
    message: "success",
    data: req.user,
  });
};

const usersInfo = (req, res) => {
  const query = "SELECT * FROM users";
  pool.query(query, (error, result) => {
    if (error) {
      return res.status(400).json({
        statusCode: res.statusCode,
        message: "İşlem Başarısız",
        data: error,
      });
    } else {
      return res.status(200).json({
        statusCode: res.statusCode,
        message: "Başarılı",
        data: result.rows,
      });
    }
  });
};

module.exports = { register, login, update, deleteUser, me, usersInfo };
