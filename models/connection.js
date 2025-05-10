require('dotenv').config();
const mysql = require("mysql2");
const conn = mysql.createConnection({
  host: process.env.DB_HOST || "localhost",
  user: process.env.DB_USER || "root",
  password: process.env.DB_PASSWORD || "",
  database: process.env.DB_NAME || "e-commerce",
});

conn.connect((err) => console.log(err || "Database Connected"));
module.exports = conn.promise();
