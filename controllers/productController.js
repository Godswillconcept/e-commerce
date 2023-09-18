const Product = require("../models/Product");
const { unlink } = require("fs");
const { resolve } = require("path");
const conn = require("../models/connection")

let getProducts = async (req, res) => {
  let products = await Product.find();
  for (const product of products) {
    product.vendors = await product.getSuppliers();
    product.stocks = await product.getTotalSupplies();
  }
  res.json(products);
};

let addProduct = async (req, res) => {
  res.send("Add Product");
};

let saveProduct = async (req, res) => {
  try {
    let { name, brand, category_id, description, quantity, price } = req.body;
    if (req.files) {
      let file = req.files.image;
      var fileName =
        Number(new Date()).toString(32) +
        Math.random().toString().slice(2) +
        "." +
        file.name.split(".").pop();
      file.mv("./uploads/products/" + fileName, function (err) {
        if (err) {
          res.send(err);
        } else {
          console.log("Product Image uploaded");
        }
      });
    }
    let product = new Product({
      name,
      brand,
      category_id: Number(category_id) || null,
      description,
      quantity,
      price,
      image: `products/${fileName}`,
    });
    await product.save();
    console.log(product);
    res.json({ success: product });
  } catch (error) {
    console.log(error);
    unlink(resolve("uploads", "products", fileName), (err) =>
      console.log(err?.message || `Deleted ${fileName}`)
    );
    res.json({ error: 0 });
  }
};

let editProduct = async (req, res) => {
  let { id } = req.params;
  let product = await Product.findById(id);
  res.json(product);
};

let updateProduct = async (req, res) => {
  let { id } = req.params;
  try {
    let { name, brand, category_id, description, quantity, price } = req.body;
    let hash = await bcrypt.hash(password, 13);
    if (req.files) {
      let file = req.files.image;
      var fileName =
        Number(new Date()).toString(32) +
        Math.random().toString().slice(2) +
        "." +
        file.name.split(".").pop();
      file.mv("./uploads/products/" + fileName, function (err) {
        if (err) {
          res.send(err);
        } else {
          console.log("image uploaded!");
        }
      });
    }
    let product = await Product.findById(id);
    Product.setProp({
      name,
      brand,
      category_id,
      description,
      quantity,
      price,
      image: `products/${fileName}`,
    });
    await product.update();
    res.json({ success: product.id });
  } catch (error) {
    res.json({ failure: 0 });
  }
};

let deleteProduct = async (req, res) => {
  let { id } = req.params;
  let product = await Product.delete();
  res.json(product);
};

let productDetail = async (req, res) => {
  let { id } = req.params;
  let product = await Product.findById(id);
  product.vendors = await product.getSuppliers();
  product.stocks = await product.getTotalSupplies();
  res.json(product);
};

let productSearch = (req, res) => {
  let { search } = req.query;
  let sql = "SELECT * products WHERE name LIKE ?";
  let value = [search];
  console.log("sql = ", sql, "value = ", value);
  try {
    conn.query(sql, value, function (err, result, field) {
      console.log("error = ", err);
      console.log("result = ", result);
      console.log("field = ", field);
    });
  } catch (error) {
    console.log(error);
  }
};

module.exports = {
  getProducts,
  addProduct,
  saveProduct,
  editProduct,
  updateProduct,
  deleteProduct,
  productDetail,
  productSearch,
};
