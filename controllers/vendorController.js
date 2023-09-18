const Vendor = require("../models/Vendor");
const Product = require("../models/Product");
const { unlink } = require("fs");
const { resolve } = require("path");

let getVendors = async (req, res) => {
  let vendors = await Vendor.find();
  for (const vendor of vendors) {
    vendor.products = [];
    let rows = await Vendor.query(
      "SELECT * FROM products WHERE id IN ( SELECT product_id FROM supplies WHERE vendor_id = ? )",
      [vendor.id]
    );
    for (const row of rows) {
      vendor.products.push(Product.instance(row));
    }
  }
  res.json(vendors);
};

let addVendor = async (req, res) => {
  res.send("Add Vendor");
};

let saveVendor = async (req, res) => {
  try {
    let { name, email, address, phone } = req.body;
    if (req.files) {
      let file = req.files.image;
      var fileName =
        Number(new Date()).toString(32) +
        Math.random().toString().slice(2) +
        "." +
        file.name.split(".").pop();
      file.mv("./uploads/vendors/" + fileName, function (err) {
        if (err) {
          res.send(err);
        } else {
          console.log("Vendor image uploaded");
        }
      });
    }

    let vendor = new Vendor({
      name,
      email,
      address,
      phone,
      image: `vendors/${fileName}`,
    });
    await vendor.save();
    console.log(vendor);
    res.json({ success: vendor });
  } catch (error) {
    unlink(resolve("uploads", "vendors", fileName), (err) =>
      console.log(err?.message || `Deleted ${fileName}`)
    );
    res.json({ error: 0 });
  }
};

let editVendor = async (req, res) => {
  let { id } = req.params;
  let vendor = await Vendor.findById(id);
  res.json(vendor);
};

let updateVendor = async (req, res) => {
  let { id } = req.params;
  try {
    let { name, email, address, phone } = req.body;
    if (req.files) {
      let file = req.files.image;
      var fileName =
        Number(new Date()).toString(32) +
        Math.random().toString().slice(2) +
        "." +
        file.name.split(".").pop();
      file.mv("./uploads/vendors/" + fileName, function (err) {
        if (err) {
          res.send(err);
        } else {
          console.log("Vendor image uploaded");
        }
      });
    }

    let vendor = await Vendor.findById(id);
    vendor.setProp({
      name,
      email,
      address,
      phone,
      image: `vendors/${fileName}`,
    });
    await vendor.update();
    res.json(vendor);
  } catch (error) {
    res.json(error.message);
  }
};

let deleteVendor = async (req, res) => {
  let { id } = req.params;
  let vendor = await Vendor.delete();
  res.json(vendor);
};

let vendorDetail = async (req, res) => {
  let { id } = req.params;
  let vendor = await Vendor.findById(id);
  vendor.products = [];
  let rows = await Vendor.query(
    "SELECT * FROM products WHERE id IN ( SELECT product_id FROM supplies WHERE vendor_id = ? )",
    [vendor.id]
  );
  for (const row of rows) {
    vendor.products.push(Product.instance(row));
  }
  res.json(vendor);
};

module.exports = {
  getVendors,
  addVendor,
  saveVendor,
  editVendor,
  updateVendor,
  deleteVendor,
  vendorDetail,
};
