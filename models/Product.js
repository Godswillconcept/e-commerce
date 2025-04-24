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

    
    static async getLatestProducts() {
        let result = [];
        let rows = await this.query(
            "SELECT * FROM products ORDER BY id DESC LIMIT 5"
        );
        for (const row of rows) {
            result.push(new Product(row));
        }
        return result;
    }

    
    static async getTopDeals() {
        let result = [];
        let rows = await this.query(
            "SELECT p.* FROM products p JOIN (SELECT product_id, SUM(quantity) AS stock FROM supplies GROUP BY product_id ORDER BY stock DESC LIMIT 1) as s ON p.id = s.product_id"
        );
        for (const row of rows) {
            result.push(new Product(row));
        }
        return result;
    }
    
}
module.exports = Product;
