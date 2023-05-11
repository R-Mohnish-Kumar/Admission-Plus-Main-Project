const mongoose = require('mongoose');

const userSchema = mongoose.Schema({
    name:{
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
    studentImageUrl:{
        required: false,
        type:String,
    },
    dateOfBirth:{
        required:false,
        type:String,
    },
    contactNo:{
        required:false,
        type:String,
    },
    fatherName:{
        required:false,
        type:String,
    },
    fathersOccupation:{
        required:false,
        type:String,
    },
    motherName:{
        required:false,
        type:String,
    },
    address:{
        required:false,
        type:String,
    },
    district:{
        required:false,
        type:String,
    },
    pincode:{
        required:false,
        type:String,
    },
    XthMarks:{
        required:false,
        type:String,
    },
    XthMarksheetLink:{
        required:false,
        type:String,
    },
    schoolName:{
        required:false,
        type:String,
    },
    XIIthMarks:{
        required:false,
        type:String,
    },
    XIIthMarksheetLink:{
        required:false,
        type:String,
    },
    highSchoolName:{
        required:false,
        type:String,
    },
    collegePreference1:{
        required:false,
        type:String,
    },
    collegePreference2:{
        required:false,
        type:String,
    },
    collegePreference3:{
        required:false,
        type:String,
    },
    appliedColleges:{

    },
    favoriteColleges:{
        
    }
});
const User=mongoose.model("User",userSchema);
module.exports=User;