const Model = require("./Model");
const Vendor = require("./Vendor");
const Product = require("./Product");

class Supply extends Model {
  constructor(obj = {}) {
    super(obj);
  }

  async getVendor() {
    return await Vendor.findById(this.vendor_id);
  }

  async getProduct() {
    return await Product.findById(this.product_id);
  }
}

module.exports = Supply;
