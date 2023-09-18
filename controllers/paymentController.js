const Payment = require("../models/Payment");


let getPayments = async (req, res) => {
  let payments = await Payment.find();
  res.json(payments);
};

let addPayment = async (req, res) => {
  res.render();
};

let savePayment = async (req, res) => {
  try {
    let { order_id, payment_date, payment_amount, payment_method } = req.body;

    let payment = new Payment({ order_id, payment_date, payment_amount, payment_method });
    await payment.save();
    res.json(payment);
  } catch (error) {
    res.json(error.message);
  }
};

let editPayment = async (req, res) => {
  let { id } = req.params;
  let payment = await Payment.findById(id);
  res.json(payment);
};

let updatePayment = async (req, res) => {
  let { id } = req.params;
  try {
    let { order_id, payment_date, payment_amount, payment_method } = req.body;
    let payment = await Payment.findById(id);
    payment.setProp({ order_id, payment_date, payment_amount, payment_method });
    await payment.update();
    res.json(payment);
  } catch (error) {
    res.json(error.message);
  }
};

let deletePayment = async (req, res) => {
  let { id } = req.params;
  let payment = await Payment.delete(id);
  res.json(payment);
};



module.exports = {
  getPayments,
  addPayment,
  savePayment,
  editPayment,
  updatePayment,
  deletePayment,
};
