const express = require("express");
const {
  getProducts,
  addProduct,
  saveProduct,
  editProduct,
  updateProduct,
  deleteProduct,
  productDetail,
  productSearch,
  latestProducts,
  topDeals,
} = require("../controllers/productController");
const {
  getSupplies,
  addSupply,
  saveSupply,
  editSupply,
  updateSupply,
  deleteSupply,
  supplyDetail,
} = require("../controllers/supplyController");
const {
  parentCategories,
  allCategories,
  addCategory,
  saveCategory,
  editCategory,
  updateCategory,
  deleteCategory,
  categoryDetail,
  productByCategory,
} = require("../controllers/categoryController");
const {
  getVendors,
  addVendor,
  saveVendor,
  editVendor,
  updateVendor,
  deleteVendor,
  vendorDetail,
} = require("../controllers/vendorController");
const {
  getUsers,
  saveUser,
  editUser,
  updateUser,
  deleteUser,
  userDetail,
  loginUser,
} = require("../controllers/userController");
const { getOrders } = require("../controllers/orderController");
const router = express.Router();

//product route
router.get("/products", getProducts);
router.get("/add-product", addProduct);
router.post("/add-product", saveProduct);
router.get("/product/:id/update", editProduct);
router.post("/product/:id/update", updateProduct);
router.get("/product/:id/delete", deleteProduct);
router.get("/product/:id/detail", productDetail);
router.get("/product?", productSearch);
router.get("/latest-products", latestProducts);
router.get("/products/top-deal", topDeals);


//vendor route
router.get("/vendors", getVendors);
router.get("/add-vendor", addVendor);
router.post("/add-vendor", saveVendor);
router.get("/vendor/:id/update", editVendor);
router.post("/vendor/:id/update", updateVendor);
router.get("/vendor/:id/delete", deleteVendor);
router.get("/vendor/:id/detail", vendorDetail);

//category route
router.get("/parent-categories", parentCategories);
router.get("/all-categories", allCategories)
router.get("/category/:id/products", productByCategory)
router.get("/add-category", addCategory);
router.post("/add-category", saveCategory);
router.get("/category/:id/update", editCategory);
router.post("/category/:id/update", updateCategory);
router.get("/category/:id/delete", deleteCategory);
router.get("/category/:id/detail", categoryDetail);

//user route
router.get("/users", getUsers);
router.post("/add-user", saveUser);
router.get("/user/:id/update", editUser);
router.post("/user/:id/update", updateUser);
router.get("/user/:id/delete", deleteUser);
router.get("/user/:id/detail", userDetail);
router.post("/auth/login", loginUser);

//supply route
router.get("/supplies", getSupplies);
router.get("/add-supply", addSupply);
router.post("/add-supply", saveSupply);
router.get("/supply/:id/update", editSupply);
router.post("/supply/:id/update", updateSupply);
router.get("/supply/:id/delete", deleteSupply);
router.get("/supply/:id/detail", supplyDetail);

//order route
router.get("/orders", getOrders);

module.exports = router;
