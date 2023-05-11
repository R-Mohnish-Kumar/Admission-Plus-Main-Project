const express = require('express');
const bcryptjs= require('bcryptjs');
const jwt = require("jsonwebtoken");
const User = require('../models/user');
const auth = require('../middleware/auth');
const CollegeUser = require('../models/collegeUser');
const authRouter = express.Router();


authRouter.get("/getcollege",async(req,res)=>{
    const data = await CollegeUser.find({}); 
    res.send(data);
});

authRouter.get("/getstudents",async(req,res)=>{
    const data = await User.find({}); 
    res.send(data);
});


//Student SignUp
authRouter.post("/api/signup", async (req, res) => {
    try {
        const { name, email, password } = req.body;

        const existingUser = await User.findOne({ email });

        if (existingUser) {
            return res.status(400).json({ msg: 'User with same email already exist..!' });
        }

        const hashedPwd=await bcryptjs.hash(password,8);
        
        let user = new User({
            email,
            password:hashedPwd,
            name,
        });

        user=await user.save(); // for adding id for the user
        res.json(user);
    } catch (e) {
        res.status(500).json({error: e.message});
    }
});

//College Admin Sign Up
authRouter.post("/api/college/signup", async (req, res) => {
    try {
        const { collegeName, email, password } = req.body;

        const existingUser = await CollegeUser.findOne({ email });

        if (existingUser) {
            return res.status(400).json({ msg: 'College User with same email already exist..!' });
        }

        const hashedPwd=await bcryptjs.hash(password,8);
        
        let user = new CollegeUser({
            email,
            password:hashedPwd,
            collegeName,
        });

        user=await user.save(); // for adding id for the college user
        res.json(user);
    } catch (e) {
        res.status(500).json({error: e.message});
    }
});

//Student Sign In

authRouter.post("/api/signin",async(req,res)=>{
    try{
        const {email,password}=req.body;

        const user=await User.findOne({email});
        if(!user){
            return res.status(400).json({msg:"User with email does not exist..!"});
        }        

        const isMatch= await bcryptjs.compare(password,user.password);
        if(!isMatch){
            return res.status(400).json({msg:'Incorrect Password..!'});
        }

        const token= jwt.sign({id:user._id},"passwordKey");
        res.json({token,...user._doc });
        
    }catch(e){
        res.status(500).json({error:e.message});
    }
})

// College Sign In
authRouter.post("/api/college/signin",async(req,res)=>{
    try{
        const {email,password}=req.body;

        const user=await CollegeUser.findOne({email});
        if(!user){
            return res.status(400).json({msg:"College User with email does not exist..!"});
        }        

        const isMatch= await bcryptjs.compare(password,user.password);
        if(!isMatch){
            return res.status(400).json({msg:'Incorrect Password..!'});
        }

        const token= jwt.sign({id:user._id},"passwordKey");
        res.json({token,...user._doc });
        
    }catch(e){
        res.status(500).json({error:e.message});
    }
})

//token is Valid or not (Student)
authRouter.post("/tokenIsValid",async(req,res)=>{
    try{
        const token = req.header("x-auth-token");
        if(!token) return res.json(false);
        const verified=jwt.verify(token,"passwordKey");
        if(!verified) return res.json(false);

        const user=await User.findById(verified.id);
        if(!user) return res.json(false);
        res.json(true);

    }catch(e){
        res.status(500).json({error:e.message});
    }
})

//token is Valid or not (College)
authRouter.post("/college/tokenIsValid",async(req,res)=>{
    try{
        const token = req.header("x-auth-token");
        if(!token) return res.json(false);
        const verified=jwt.verify(token,"passwordKey");
        if(!verified) return res.json(false);

        const user=await CollegeUser.findById(verified.id);
        if(!user) return res.json(false);
        res.json(true);

    }catch(e){
        res.status(500).json({error:e.message});
    }
})


//Get Student Data
authRouter.get("/",auth,async(req,res)=>{
    const user= await User.findById(req.user);
    res.json({...user._doc,token:req.token});
});

// Get College Data
authRouter.get("/college",auth,async(req,res)=>{
    const user= await CollegeUser.findById(req.user);
    res.json({...user._doc,token:req.token});
});

// Update Student
authRouter.put("/api/update/:id", async (req,res)=>{
    try{
    const updateData=req.body;
    await User.findOneAndUpdate(
        {_id: req.params.id},
        {$set:updateData}).then((err,result)=>{
            if(err) return res.status(500).json({msg:err});
            const msg={
                msg:"Data Updated Successfully..!",
                id:req.params.id,
            };
            return res.json(msg);
        });
    }catch(e){
        res.status(500).json({error: e.message});
    }
})

// Update College
authRouter.patch("/api/college/update/:id", async (req,res)=>{
    try{
    const updateData=req.body;
    await CollegeUser.findOneAndUpdate(
        {_id: req.params.id},
        {$set:updateData}).then((err,result)=>{
            if(err) return res.status(500).json({msg:err});
            const msg={
                msg:"Data Updated Successfully..!",
                id:req.params.id,
            };
            return res.json(msg);
        });
    }catch(e){
        res.status(500).json({error: e.message});
    }
})

// Add Student Application to College
authRouter.patch("/api/college/update/application/:id", async (req,res)=>{
    try{
    const updateData=req.body;
    await CollegeUser.updateOne(
        {_id: req.params.id},
        {$addToSet:{'studentsApplied':updateData}}).then((err,result)=>{
            if(err) return res.status(500).json({msg:err});
            const msg={
                msg:"Data Updated Successfully..!",
                id:req.params.id,
            };
            return res.json(msg);
        });
    }catch(e){
        res.status(500).json({error: e.message});
    }
})

// Add Student Application to Student Profile
authRouter.patch("/api/student/update/application/:id", async (req,res)=>{
    try{
    const updateData=req.body;
    await User.updateOne(
        {_id: req.params.id},
        {$addToSet:{'appliedColleges':updateData}}).then((err,result)=>{
            if(err) return res.status(500).json({msg:err});
            const msg={
                msg:"Data Updated Successfully..!",
                id:req.params.id,
            };
            return res.json(msg);
        });
    }catch(e){
        res.status(500).json({error: e.message});
    }
})

authRouter.patch("/api/student/update/application/isaccepted/:id", async (req,res)=>{
    try{
    const updateData=req.body;
    await User.updateOne(
        {_id: req.params.id},
        {$set:{'isAccepted':updateData}}).then((err,result)=>{
            if(err) return res.status(500).json({msg:err});
            const msg={
                msg:"Data Updated Successfully..!",
                id:req.params.id,
            };
            return res.json(msg);
        });
    }catch(e){
        res.status(500).json({error: e.message});
    }
})

//Add Favorite College to Student Profile
authRouter.patch("/api/student/update/favorite/:id", async (req,res)=>{
    try{
    const updateData=req.body;
    await User.updateOne(
        {_id: req.params.id},
        {$addToSet:{'favoriteColleges':updateData}}).then((err,result)=>{
            if(err) return res.status(500).json({msg:err});
            const msg={
                msg:"Data Updated Successfully..!",
                id:req.params.id,
            };
            return res.json(msg);
        });
    }catch(e){
        res.status(500).json({error: e.message});
    }
})

authRouter.patch("/api/college/accepted/:id", async (req,res)=>{
    try{
    const updateData=req.body;
    //$set:{'isAccepted':true};
    await CollegeUser.updateOne(
        {_id: req.params.id},
        {$addToSet:{'acceptedApplication':updateData}}).then((err,result)=>{
            if(err) return res.status(500).json({msg:err});
            const msg={
                msg:"Data Updated Successfully..!",
                id:req.params.id,
            };
            return res.json(msg);
        });
    }catch(e){
        res.status(500).json({error: e.message});
    }
})

module.exports = authRouter;