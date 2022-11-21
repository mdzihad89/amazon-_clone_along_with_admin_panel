const express = require("express");
const admin = require("../middlewares/admin");
const { Product } = require("../model/product");
const Order = require("../model/order");


const adminRouter = express.Router();

adminRouter.post("/admin/add-product", admin, async (req, res) => {
  try {
    const { name, description, imageFileList, quantity, price, category } =
      req.body;

    let product = new Product({
      name,
      description,
      imageFileList,
      quantity,
      price,
      category,
    });


    product=await product.save();
    res.json(product);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//get all product

adminRouter.get('/admin/get-products',admin,async(req,res)=>{

    try {
        const products=await Product.find({})
        res.json(products);

        
    } catch (e) {

        res.status(500).json({ error: e.message });
    }
});

//delete product

adminRouter.post('/admin/delete-product',admin,async(req,res)=>{
 try {
    const {id}=req.body;
    let product=await Product.findByIdAndDelete(id);
    res.json(product);
 } catch (e) {
    res.status(500).json({ error: e.message });
 }

});

//category add


//
adminRouter.get("/admin/get-orders", admin, async (req, res) => {
  try {
    const orders = await Order.find({});
    res.json(orders);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

adminRouter.post("/admin/change-order-status", admin, async (req, res) => {
  try {
    const { id, status } = req.body;
    let order = await Order.findById(id);
    order.status = status;
    order = await order.save();
    res.json(order);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});


adminRouter.get("/admin/analytics", admin, async (req, res) => {
  try {
    const orders = await Order.find({});
    let totalEarnings = 0;

    for (let i = 0; i < orders.length; i++) {
      for (let j = 0; j < orders[i].products.length; j++) {
        totalEarnings +=
          orders[i].products[j].quantity * orders[i].products[j].product.price;
      }
    }
    // CATEGORY WISE ORDER FETCHING
    let mobileEarnings = await fetchCategoryWiseProduct("Mobiles");
    let essentialEarnings = await fetchCategoryWiseProduct("Essentials");
    let applianceEarnings = await fetchCategoryWiseProduct("Appliances");
    let booksEarnings = await fetchCategoryWiseProduct("Books");
    let fashionEarnings = await fetchCategoryWiseProduct("Fashion");

    let earnings = {
      totalEarnings,
      mobileEarnings,
      essentialEarnings,
      applianceEarnings,
      booksEarnings,
      fashionEarnings,
    };

    res.json(earnings);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

async function fetchCategoryWiseProduct(category) {
  let earnings = 0;
  let categoryOrders = await Order.find({
    "products.product.category": category,
  });

  for (let i = 0; i < categoryOrders.length; i++) {
    for (let j = 0; j < categoryOrders[i].products.length; j++) {
      earnings +=
        categoryOrders[i].products[j].quantity *
        categoryOrders[i].products[j].product.price;
    }
  }
  return earnings;
}









module.exports=adminRouter;