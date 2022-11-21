const express = require("express");
const User = require("../model/user");
const bcryptjs=require('bcryptjs');
const jwt=require('jsonwebtoken');
const auth = require("../middlewares/auth");


const authRouter = express.Router();
//sign up route

authRouter.post("/api/signup", async (req, res) => {
 try {
    const { name, email, password } = req.body;

    //validation
  
    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res.status(400).json({ msg: "Email is already exist" });
    }
    //verify phone number 

    //hash password
   const hashpassword=await bcryptjs.hash(password,8);
  
    //post in database
  
    let user = new User({
      email,
      password:hashpassword,
      name,
    });
    user=await user.save();
  
    res.json(user);

 } catch (e) {

    res.status(500).json({ error: e.message });
    
 }
});


//sign in route

authRouter.post("/api/signin", async (req, res) => {
  try {
     const { email, password } = req.body;
 
     //compare email
   
     const user = await User.findOne({ email });

     if (!user) {
       return res.status(400).json({ msg: "This email doesn't exist"});
     }
 
     //comparer password
 
    const isMatchPassword=await bcryptjs.compare(password,user.password);

    if(!isMatchPassword){
      return res.status(400).json({ msg: "Incorrect Password"});
    }

    //generate token

   const token= jwt.sign({id: user._id},"passwordKey");
   res.json({token,...user._doc})

 
  } catch (e) {
 
     res.status(500).json({ error: e.message });
     
  }
 });

 //token validation

 authRouter.post('/tokenIsValid',async(req,res)=>{

  try {

    const token=req.header('x-auth-token');
    if(!token){
      res.json(false);
    }
    
    const varified=jwt.verify(token,"passwordKey");

    if(!varified){
      res.json(false);
    }

    res.json(true);


    const user=await User.findById(varified.id);



  } catch (e) {
    res.status(500).json({ error: e.message });
  }
 })

//get User Data

 authRouter.get('/',auth, async(req,res)=>{

  try {
    const user=await User.findById(req.user);

    res.json({...user._doc,token:req.token});


  } catch (e) {
    res.status(500).json({ error: e.message });


  }
 });

module.exports = authRouter;
