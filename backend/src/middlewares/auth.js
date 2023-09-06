const jwt = require("jsonwebtoken");
const pool = require("../db/db.connection");

const createToken = async (user, res) => {
  const payload = {
    // jwt ios sitesinde kullanıcı id ve name girilmesi tavisye edilir o yüzden sub ve name dedik.
    sub: user[0].user_id,
    name: user[0].username,
  };
  const token = await jwt.sign(payload, process.env.JWT_SECRET_KEY, {
    algorithm: "HS512",
    expiresIn: process.env.JTW_EXPRESS_IN, // token süresi.
  });
  return res.status(201).json({
    success: true,
    token,
    messages: "Başarılı",
  });
};

const tokenCheck = async (req, res, next) => {
  const headerToken =
    req.headers.authorization &&
    req.headers.authorization.startsWith("Bearer ");
  console.log(headerToken);
  if (!headerToken) {
    return res.status(401).json({
      messages: "Geçersiz oturum",
    });
  } else {
    const token = req.headers.authorization.split(" ")[1]; // göndermiş olduğumz Bearer tokeni gelen metni her bir boşluktan ayırıp tokeni almış olduk.
    console.log(token);
    await jwt.verify(token, process.env.JWT_SECRET_KEY, async (err, decode) => {
      // jwt.verify ile tokeni çözümleriz.
      // jwt secret key yardımı ile çözümleriz
      if (err) {
        return res.status("Geçersiz Token");
      } else {
        const query = "SELECT user_id,username,email,created_on FROM users";
        pool.query(query, (err, result) => {
          if (err) {
            return res.status(400).json({
              messages: "Data error",
            });
          }
          req.user = result.rows;
          next();
        });
      }
    });
  }
};

module.exports = {
  createToken,
  tokenCheck,
};
