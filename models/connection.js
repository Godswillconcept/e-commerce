const mysql = require("mysql2");
const conn = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "e-commerce",
});

conn.connect((err) => console.log(err || "Database Connected"));
module.exports = conn.promise();

