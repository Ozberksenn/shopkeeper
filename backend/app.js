const { query } = require("express");
const express = require("express"); // express require
const pool = require("./src/db/db.connection");
app = express();
require("dotenv").config(); // called port info
const port = process.env.PORT; // port info
require("./src/db/db.connection"); // database connection

const authController = require("./src/controller/auth_controller/auth");
const productsController = require("./src/controller/porudcts_controller/products_controller");
const { tokenCheck } = require("./src/middlewares/auth");
// Bu Middleware'leri kullanarak req.body özelliğine erişebilirsiniz.
app.use(express.json()); //express.json() Middleware'i, JSON verilerini ayrıştırmak için kullanılır
app.use(express.urlencoded({ extended: true })); //express.urlencoded() Middleware'i, URL kodlu form verilerini ayrıştırmak için kullanılır.

app.get("/", (req, res) => {
  res.send("Hoşgeldiniz");
});

app.listen(port, () => {
  console.log(port, "Portunda çalıştı");
});
app.post("/register", authController.register);

app.post("/login", authController.login);

app.post("/update", authController.update);

app.post("/delete", authController.deleteUser);

app.get("/products", productsController.products);

app.get("/me", tokenCheck, authController.me);
