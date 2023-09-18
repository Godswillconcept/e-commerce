const Order = require("../models/Order");
const Product = require("../models/Product");
const OrderDetail = require("../models/OrderDetail");

let getOrders = async (req, res) => {
  let orders = await Order.find();
  for (const order of orders) {
    let details = await OrderDetail.find(["order_id", order.id]);
    for (const detail of details) {
      detail.product = await Product.findById(detail.product_id);
    }
    order.detail = details;
  }

  res.json(orders);
};

let addOrder = async (req, res) => {
  res.render();
};

let saveOrder = async (req, res) => {
  let { user_id, detail } = req.body;
  let date = new Date().toISOString();
  try {
    let order_date = date;
    let order = new Order({ user_id, order_date, status: "Pending" });
    let orderDetails = [];
    let total = 0;
    for (let i = 0; i < detail.length; i++) {
      var orderItem = await Product.findById(detail[i].product_id);
      total += Number(orderItem.price) * detail[i].quantity;
      orderDetails.push(
        new OrderDetail({
          product_id: detail[i].product_id,
          quantity: detail[i].quantity,
        })
      );
    }
    order.total = total;
    console.log(order);
    await order.save();
    for (const orderDetail of orderDetails) {
      orderDetail.order_id = order.id;
      await orderDetail.save();
      orderDetail.product = await Product.findById(orderDetail.product_id);
    }
    console.log(orderDetails);
    order.detail = orderDetails;
    console.log("Order saved successfully!");

    res.json({ success: order });
  } catch (error) {
    res.json({ error: 0 });
  }
};

let editOrder = async (req, res) => {
  let { id } = req.params;
  let order = await Order.findById(id);
  res.json(order);
};

let updateOrder = async (req, res) => {
  let { id } = req.params;
  try {
    let { user_id, order_date, status } = req.body;
    let order = await Order.findById(id);
    order.setProp({ user_id, order_date, status });
    await order.update();
    res.json(order);
  } catch (error) {
    res.json(error.message);
  }
};

let deleteOrder = async (req, res) => {
  let { id } = req.params;
  let order = await Order.delete();
  res.json(order);
};

let orderDetail = async (req, res) => {
  let { id } = req.params;
  let order = await Order.findById(id);
  res.json(order);
};
let orderByUser = async (req, res) => {
  let { user_id } = req.params;
  let orders = await Order.find(["user_id", user_id]);
  for (const order of orders) {
    let details = await OrderDetail.find(["order_id", order.id]);
    for (const detail of details) {
      detail.product = await Product.findById(detail.product_id);
    }
    order.detail = details;
  }
  res.json(orders);
};

module.exports = {
  getOrders,
  addOrder,
  saveOrder,
  editOrder,
  updateOrder,
  deleteOrder,
  orderDetail,
  orderByUser,
};
