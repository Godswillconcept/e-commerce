const Model = require("./Model");
const Vendor = require("./Vendor");

class Product extends Model {

    async getTotalSupplies() {
        let [result] = await this.constructor.query(
            "SELECT SUM(quantity) AS stock FROM supplies WHERE product_id = ?", [this.id]
        );
        return result.stock;
    }

    async getSuppliers() {
        let result = []
        let rows = await this.constructor.query(
            "SELECT * FROM vendors WHERE id IN ( SELECT vendor_id FROM supplies WHERE product_id = ? )", [this.id]
        );
        for (const row of rows) {
            result.push(new Vendor(row));
        }
        return result;
    }
}
module.exports = Product;
