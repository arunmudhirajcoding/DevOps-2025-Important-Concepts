import express from 'express';
const app = express();
app.get("/",(req,res)=>{
    res.send(" world");
})
app.listen(4000,()=>{
    console.log("app is running on port 4000");
})
