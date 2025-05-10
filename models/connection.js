require('dotenv').config();
const mysql = require("mysql2");
const conn = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  port: process.env.DB_PORT,
  uri: process.env.DB_URI
});

conn.connect((err) => console.log(err || "Database Connected"));
module.exports = conn.promise();
