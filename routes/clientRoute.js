const { Router } = require("express");
const { loginUser, saveUser, getUsers } = require("../controllers/userController");
const { saveReview } = require("../controllers/reviewController");
const { saveOrder, getOrders, orderByUser } = require("../controllers/orderController");
const { getProducts, productSearch } = require("../controllers/productController");
const { parentCategories, productByCategory } = require("../controllers/categoryController");
const router = Router();

//product route
router.get("/products", getProducts);
router.get("/product?", productSearch);


//user route
router.post("/login", loginUser);
router.post("/signup", saveUser);
router.get("/users", getUsers);


//category route
router.get("/parent-categories", parentCategories);
router.get("/category/:id/products", productByCategory);


//review route
router.post("/review", saveReview);


//order route
router.post("/order", saveOrder);
router.get("/orders", getOrders);
router.get("/order/:user_id/detail", orderByUser)


module.exports = router;
