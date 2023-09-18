const Review = require("../models/Review");

let getReviews = async (req, res) => {
  let reviews = await Review.find();
  res.json(reviews);
};

let saveReview = async (req, res) => {
  try {
    let { product_id, user_id, rating, comment, review_date } = req.body;
    let review = new Review({
      product_id,
      user_id,
      rating,
      comment,
      review_date,
    });
    await review.save();
    res.json({ success: review });
  } catch (error) {
    res.json({ error: 0 });
  }
};

let editReview = async (req, res) => {
  let { id } = req.params;
  let review = await Review.findById(id);
  res.json(review);
};

let updateReview = async (req, res) => {
  let { id } = req.params;
  try {
    let { product_id, user_id, rating, comment, review_date } = req.body;
    let review = await Review.findById(id);
    review.setProp({ product_id, user_id, rating, comment, review_date });
    await review.update();
    res.json({ success: review });
  } catch (error) {
    res.json({ error: 0 });
  }
};

let deleteReview = async (req, res) => {
  let { id } = req.params;
  let review = await Review.delete(id);
  res.json(review);
};

module.exports = {
  getReviews,
  saveReview,
  editReview,
  updateReview,
  deleteReview,
};
