const User = require("../models/User");
const bcrypt = require('bcrypt');
const { unlink } = require('fs');
const { resolve } = require("path");

let getUsers = async (req, res) => {
  let users = await User.find();
  res.json(users);
};

let saveUser = async (req, res) => {
  try {
    let {
      first_name,
      last_name,
      email,
      address,
      password,
      phone,
      gender,
      dob,
    } = req.body;
    if (req.files) {
      let file = req.files.image;
      var fileName =
        Number(new Date()).toString(32) +
        Math.random().toString().slice(2) +
        "." +
        file.name.split(".").pop();
      file.mv("./uploads/users/" + fileName, function (err) {
        if (err) {
          res.send(err);
        } else {
          console.log("User image uploaded");
        }
      });
    }
    let hash = await bcrypt.hash(password, 13);
    let user = new User({
      first_name,
      last_name,
      email,
      address,
      password: hash,
      phone,
      gender,
      dob,
      image: `users/${fileName}`
    });
    await user.save();
    console.log("New User saved");
    res.json({ success: user });
  } catch (error) {
    unlink(resolve('uploads', 'users', fileName),
      (err) => console.log(err?.message || `Deleted ${fileName}`),
    );
    res.json({ error: 0 });
  }
};

let editUser = async (req, res) => {
  let { id } = req.params;
  let user = await User.findById(id);
  res.json(user);
};

let updateUser = async (req, res) => {
  let { id } = req.params;
  try {
    let {
      first_name,
      last_name,
      username,
      email,
      address,
      password,
      phone,
      gender,
      dob,
    } = req.body;
    let hash = await bcrypt.hash(password, 13);
    if (req.files) {
      let file = req.files.image;
      var fileName =
        Number(new Date()).toString(32) +
        Math.random().toString().slice(2) +
        "." +
        file.name.split(".").pop();
      file.mv("./uploads/users/" + fileName, function (err) {
        if (err) {
          res.send(err);
        } else {
          console.log("User Image uploaded");
        }
      });
    }
    let user = await User.findById(id);
    user.setProp({
      first_name,
      last_name,
      username,
      email,
      address,
      password: hash,
      phone,
      gender,
      dob,
      image: `users/${fileName}`
    });
    await user.update();
    res.json(user);
  } catch (error) {
    res.json(error.message);
  }
};

let deleteUser = async (req, res) => {
  let { id } = req.params;
  let user = await User.delete(id);
  res.json(user);
};

let userDetail = async (req, res) => {
  let { id } = req.params;
  let user = await User.findById(id);
  res.json(user);
};

let loginUser = async (req, res) => {
  try {
    let { email, password } = req.body;
    let userInfo = await User.findByEmail(email);
    if (userInfo) {
      let hashedPassword = userInfo.password;
      let passwordMatch = bcrypt.compareSync(password, hashedPassword);
      if (passwordMatch) {
        console.log("Password match!");
        res.json({ success: userInfo });
      } else {
        console.log("Passwords do not match!");
        res.json({ success: "Passwords do not match!" });
      }
    } else {
      res.json({ error: "User not found!" });
    }
  } catch (error) {
    console.log(error);
    res.json({ error: "Internal Server Error" });
  }
}

module.exports = {
  getUsers,
  saveUser,
  editUser,
  updateUser,
  deleteUser,
  userDetail,
  loginUser,
};
