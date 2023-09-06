const { Pool } = require("pg");
require("dotenv").config();
const pool = new Pool({
  user: process.env.DB_USER,
  host: "localhost",
  database: process.env.DATABASE,
  password: process.env.DB_PASSWORD,
  port: 5432,
});

// we are testing connecting to database.
pool.query("SELECT NOW()", (error, results) => {
  if (error) {
    console.error("Veritabanı bağlantısı başarısız:", error);
  } else {
    console.log(
      "Veritabanına başarıyla bağlandınız! Şu anki zaman:",
      results.rows[0].now
    );
  }
});

module.exports = pool;
