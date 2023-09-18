const Product = require("../models/Product");
const Supply = require("../models/Supply");
const Vendor = require("../models/Vendor");

let getSupplies = async (req, res) => {
  let supplies = await Supply.find();
  for (const supply of supplies) {
    supply.vendor = await supply.getVendor();
    supply.product = await supply.getProduct();
  }
  res.json(supplies);
};

let addSupply = async (req, res) => {
  res.send("Add Supply");
};

let saveSupply = async (req, res) => {
  try {
    let { product, vendor, quantity, date } = req.body;
    let product_id = product.id;
    let vendor_id = vendor.id;
    let item = await Product.findById(product_id);
    let price = Number(item.price);
    let total_amount = price * quantity;
    let supply = new Supply({
      product_id,
      vendor_id,
      quantity,
      date,
      total_amount,
    });
    await supply.save();
    supply.product = item;
    supply.vendor = await Vendor.findById(supply.vendor_id);
    console.log(supply);
    console.log("New supply made");
    res.json({ success: supply });
  } catch (error) {
    res.json({ error: 0 });
  }
};

let editSupply = async (req, res) => {
  let { id } = req.params;
  let supply = await Supply.findById(id);
  res.json(supply);
};

let updateSupply = async (req, res) => {
  let { id } = req.params;
  try {
    let { product_id, vendor_id, quantity, date } = req.body;
    let product = await Product.findById(product_id);
    let total_amount = product * quantity;
    let supply = await Supply.findById(id);
    supply.setProp({ product_id, vendor_id, quantity, date, total_amount });
    await supply.update();
    res.json(supply);
  } catch (error) {
    res.json(error.message);
  }
};

let deleteSupply = async (req, res) => {
  let { id } = req.params;
  let supply = await Supply.delete();
  res.json(supply);
};

let supplyDetail = async (req, res) => {
  let { id } = req.params;
  let supply = await Supply.findById(id);
  res.json(supply);
};

module.exports = {
  getSupplies,
  addSupply,
  saveSupply,
  editSupply,
  updateSupply,
  deleteSupply,
  supplyDetail,
};
