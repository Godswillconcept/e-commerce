require('dotenv').config();
const mysql = require("mysql2");
const conn = mysql.createConnection({
  host: process.env.DB_HOST || "localhost",
  user: process.env.DB_USER || "root",
  password: process.env.DB_PASSWORD || "",
  database: process.env.DB_NAME || "e-commerce",
  port: process.env.DB_PORT || 3306,
  uri: process.env.DB_URI || "mysql://root:@localhost:3306/e-commerce"
});

conn.connect((err) => console.log(err || "Database Connected"));
module.exports = conn.promise();
