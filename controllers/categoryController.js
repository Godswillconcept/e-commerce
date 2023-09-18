const { resolve } = require("path");
const Category = require("../models/Category");
const { unlink } = require("fs");

let parentCategories = async (req, res) => {
  let categories = await Category.getBaseCategories();
  for (let category of categories) {
    await category.deepChildren();
  }
  res.json(categories);
};

let productByCategory = async (req, res) => {
  let products = [];
  let category = await Category.findById(req.params.id);
  products.push(...(await category.getProductsByCategory()));
  let children = await category.allSubCategories();
  for (const child of children) {
    products.push(...(await child.getProductsByCategory()));
  }
  res.json(products);
};

let allCategories = async (req, res) => {
  let categories = await Category.find();
  res.json(categories);
};

let addCategory = async (req, res) => {
  res.send("Add category");
};

let saveCategory = async (req, res) => {
  try {
    let { name, parent_id, description } = req.body;
    if (req.files) {
      let file = req.files.icon;
      var fileName =
        Number(new Date()).toString(32) +
        Math.random().toString().slice(2) +
        "." +
        file.name.split(".").pop();
      file.mv("./uploads/categories/" + fileName, function (err) {
        if (err) {
          res.send(err);
        } else {
          console.log("Category icon uploaded");
        }
      });
    }

    let category = new Category({
      name,
      parent_id: Number(parent_id) || null,
      description,
      icon: `categories/${fileName}`,
    });
    console.log(category);
    await category.save();
    res.json({ success: category });
  } catch (error) {
    console.log(error);
    unlink(resolve("uploads", "categories", fileName), (err) =>
      console.log(err?.message || `Deleted ${fileName}`)
    );
    res.json({ error: 0 });
  }
};

let editCategory = async (req, res) => {
  let { id } = req.params;
  let category = await Category.findById(id);
  res.json(category);
};

let updateCategory = async (req, res) => {
  let { id } = req.params;
  try {
    let { name, parent_id, description } = req.body;
    if (req.files) {
      let file = req.files.icon;
      var fileName =
        Number(new Date()).toString(32) +
        Math.random().toString().slice(2) +
        "." +
        file.name.split(".").pop();
      file.mv("./uploads/categories/" + fileName, function (err) {
        if (err) {
          res.send(err);
        } else {
          console.log("Category icon uploaded");
        }
      });
    }
    let category = await Category.findById(id);
    Category.setProp({
      name,
      parent_id,
      description,
      icon: `categories/${fileName}`,
    });
    await category.update();
    res.json(category);
  } catch (error) {
    res.json(error.message);
  }
};

let deleteCategory = async (req, res) => {
  let { id } = req.params;
  let category = await Category.delete();
  res.json(category);
};

let categoryDetail = async (req, res) => {
  let { id } = req.params;
  let category = await Category.findById(id);
  category.products = await category.getProductsByCategory();
  res.json(category);
};

module.exports = {
  parentCategories,
  productByCategory,
  allCategories,
  addCategory,
  saveCategory,
  editCategory,
  updateCategory,
  deleteCategory,
  categoryDetail,
};
