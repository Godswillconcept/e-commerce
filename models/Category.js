const Model = require("./Model");
const Product = require("./Product");

class Category extends Model {
  async getProductsByCategory() {
    let result = [];
    let rows = await this.constructor.query(
      "SELECT * FROM products WHERE category_id = ?",
      [this.id]
    );
    for (const row of rows) {
      result.push(new Product(row));
    }
    return result;
  }

  async getLatestProducts() {
    let result = [];
    let rows = await this.constructor.query(
      "SELECT p.* FROM products p JOIN supplies s ON p.id = s.product_id WHERE p.category_id = ? ORDER BY s.date DESC LIMIT 5",
      [this.id]
    );
    for (const row of rows) {
      result.push(new Product(row));
    }
    return result;
  }

  static async getBaseCategories() {
    let result = [];
    let rows = await Category.query(
      "SELECT * FROM categories WHERE parent_id IS NULL"
    );
    for (const row of rows) {
      result.push(new Category(row));
    }
    return result;
  }

  async allSubCategories(){
    let children = []
    let sql = 'SELECT * FROM categories WHERE parent_id = ?'
    let rows = await this.constructor.query(sql, [this.id]);
    for (const row of rows) {
      children.push(Category.instance(row));
    }
    for (const child of children) {
      children = [...children, ...(await child.allSubCategories())]
    }
    return children;
  }

  async deepChildren (){
    this.children = [];
    let sql = 'SELECT * FROM categories WHERE parent_id = ?'
    let rows = await this.constructor.query(sql, [this.id]);
    for (const row of rows) {
      this.children.push(Category.instance(row));
    }
    for (const child of this.children) {
      await child.deepChildren();
    }
  }
}
module.exports = Category;
