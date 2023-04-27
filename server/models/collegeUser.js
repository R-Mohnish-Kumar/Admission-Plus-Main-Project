const mongoose = require('mongoose');

const collegeUserSchema = mongoose.Schema({
    collegeName:{
        required:true,
        type:String,
        trim:true,
    },
    email:{
        required:true,
        type:String,
        trim:true,
        validate:{
            validator:(value)=>{
                const re=/^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                return value.match(re);
            },
            message:"Please enter valid email address..!"
        }
    },
    password:{
        required:true,
        type:String,
    },
    description:{
        required:false,
        type:String,
    },
    location:{
        required:false,
        type:String,
    },
    courses:{
    },
    departments:{
    },
    foundedYear:{
        required:false,
        type:String,
    },
    rank:{
        required:false,
        type:String,
    },
    affiliatedTo:{
        required:false,
        type:String,
    },
    website:{
        required:false,
        type:String,
    },
});
const CollegeUser=mongoose.model("College_User",collegeUserSchema);
module.exports=CollegeUser;