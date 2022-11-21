//import from package
const  express=require('express');
const  mongoose =require('mongoose');
const  http=require('http');

//import from file

const authRouter = require("./router/authRouter");
const adminRouter = require('./router/adminRouter');
const productRouter = require('./router/productRouter');
const userRouter = require('./router/userRouter');

// INIT
const PORT=process.env.PORT||3005;
const  app=express();
const DB="mongodb+srv://mdzihad:1742301@amazon.z7qfdez.mongodb.net/?retryWrites=true&w=majority";

//middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);

//connection

mongoose.connect(DB)
    .then(()=>{
    console.log("connect database");
})

app.listen(PORT,'0.0.0.0',()=>{
    console.log(`connected server ${PORT}`);
})