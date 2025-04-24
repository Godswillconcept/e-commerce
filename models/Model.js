/**
 * This is the base model class that all other models will extend from. It has
 * some useful static and instance methods that can be used to interact with
 * the database.
 * @class
 */
const conn = require("./connection");
const pluralize = require("pluralize");
class Model {
  /**
   * Constructor that takes an object with properties and sets them as properties
   * on the instance
   * @param {Object} obj - The object with properties
   */
  constructor(obj = {}) {
    this.setProp(obj);
  }

  /**
   * Method that sets the properties of the instance from an object
   * @param {Object} obj - The object with properties
   */
  setProp(obj) {
    for (const key in obj) {
      this[key] = obj[key];
    }
  }

  /**
   * Static method that returns a new instance of the class
   * @param {Object} obj - The object with properties
   * @returns {Model} - A new instance of the class
   */
  static instance(obj) {
    return new this(obj);
  }

  /**
   * Static method that returns the name of the table for the model
   * @returns {String} - The name of the table for the model
   */
  static get tableName() {
    let snake_case = this.name.replace(
      /.[A-Z]/g,
      (mch) => mch[0] + "_" + mch[1]
    );
    return pluralize(snake_case.toLowerCase());
  }

  /**
   * Static method that returns the name of the class field if it exists
   * @returns {String} - The name of the class field if it exists
   */
  static get classField() {
    return "";
  }

  /**
   * Instance method that saves the instance to the database
   * @returns {Promise<Boolean>} - A promise that resolves to true if the instance
   * was saved successfully
   */
  async save() {
    let columns = Object.keys(this);
    let sql = `INSERT INTO ${this.constructor.tableName} (${columns.join(
      ", "
    )}) VALUES (${"?".repeat(columns.length).split("").join(", ")})`;
    let [result] = await conn.execute(sql, Object.values(this));
    this.id = result.insertId;
    return true;
  }

  /**
   * Static method that takes a sql query and an array of parameters and executes
   * the query
   * @param {String} sql - The sql query
   * @param {Array} params - The array of parameters
   * @returns {Promise<Array>} - A promise that resolves to an array of results
   */
  static async query(sql, params = []) {
    if (this.classField != "") {
      if (sql.toLowerCase().indexOf("where") == -1) sql += " WHERE ";
      else sql += " AND ";
      sql += this.classField;
    }

    let [results] = await conn.execute(sql, params);
    return results;
  }

  /**
   * Static method that takes an array of filters and returns an array of instances
   * that match the filters
   * @param {Array} filters - The array of filters
   * @returns {Promise<Array>} - A promise that resolves to an array of instances
   */
  static async find(filters = []) {
    let result = [];
    let sql = `SELECT * from ${this.tableName}`;
    let params = [];
    if (filters.length > 0) {
      sql += " WHERE ";
      let opr = "=";
      let prop = "";
      let val = "";
      for (const filter of filters) {
        if (Array.isArray(filter)) {
          if (filter.length > 2) {
            opr = filter[1];
            prop = filter[0];
            val = filter[2];
          } else if (filter.length == 2) {
            prop = filter[0];
            val = filter[1];
          }
          sql += ` ${prop} ${opr} ? AND`;
          params.push(val);
        } else {
          if (filters.length > 2) {
            opr = filters[1];
            prop = filters[0];
            val = filters[2];
          } else if (filters.length == 2) {
            prop = filters[0];
            val = filters[1];
          }
          sql += ` ${prop} ${opr} ? AND`;
          params.push(val);
          break;
        }
      }
    }
    sql = sql.replace(/ AND$/, "");
    let rows = await this.query(sql, params);
    for (const row of rows) {
      result.push(new this(row));
    }
    return result;
  }

  /**
   * Static method that takes an id and returns an instance that matches the id
   * @param {Number} id - The id
   * @returns {Promise<Model>} - A promise that resolves to an instance or null
   */
  static async findById(id) {
    let sql = `SELECT * FROM ${this.tableName} WHERE id=?`;

    let [rows] = await conn.execute(sql, [id]);
    if (rows.length) {
      let row = rows[0];
      return new this(row);
    }
    return null;
  }

  /**
   * Static method that takes an email and returns an instance that matches the email
   * @param {String} email - The email
   * @returns {Promise<Model>} - A promise that resolves to an instance or null
   */
  static async findByEmail(email) {
    let sql = `SELECT * FROM ${this.tableName} WHERE email=?`;

    let [rows] = await conn.execute(sql, [email]);
    if (rows.length) {
      let row = rows[0];
      return new this(row);
    }
    return null;
  }

  /**
   * Instance method that updates the instance in the database
   * @returns {Promise<Boolean>} - A promise that resolves to true if the instance
   * was updated successfully
   */
  async update() {
    let { id, ...objWithoutId } = this;
    let columns = Object.keys(objWithoutId);
    let sql = `UPDATE ${this.constructor.tableName} SET `;
    let i = 1;
    for (const column of columns) {
      sql += `${column} = ?${i == columns.length ? "" : ","} `;
      i++;
    }
    sql += `WHERE id = ?`;
    let [result] = await conn.execute(sql, [
      ...Object.values(objWithoutId),
      this.id,
    ]);
    return result.affectedRows > 0;
  }

  /**
   * Instance method that deletes the instance from the database
   * @returns {Promise<Boolean>} - A promise that resolves to true if the instance
   * was deleted successfully
   */
  async delete() {
    let sql = `DELETE FROM ${this.constructor.tableName} WHERE id = ?`;
    let [result] = await conn.execute(sql, [this.id]);
    return result.affectedRows > 0;
  }

  /**
   * Static method that takes an id and deletes the instance from the database
   * @param {Number} id - The id
   * @returns {Promise<Boolean>} - A promise that resolves to true if the instance
   * was deleted successfully
   */
  static async delete(id) {
    let sql = `DELETE FROM ${this.tableName} WHERE id = ?`;
    let [result] = await conn.execute(sql, [id]);
    return result.affectedRows > 0;
  }

  /**
   * Method that returns a string representation of the object
   * @returns {String} - The string representation of the object
   */
  toString() {
    return this.name || "No string representation of the object";
  }
}

module.exports = Model;
