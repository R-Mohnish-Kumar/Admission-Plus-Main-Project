const express= require('express');
const mongoose= require('mongoose');
const authRouter = require('./routes/auth');

const PORT = process.env.PORT || 3000;
const app=express();

app.use(express.json());
app.use(authRouter);

const MONGO_CONN_URL=
"mongodb+srv://mohnish694:Aishuma5@cluster0.8tpmc9w.mongodb.net/AdmissionPlus?retryWrites=true&w=majority";

mongoose.connect(MONGO_CONN_URL).then(()=>{
    console.log("Connection Successfull..!")
}).catch((e)=>{
    console.log(e);
}
);
app.listen(PORT,"0.0.0.0",()=>{
    console.log(`connected at port ${PORT}`);
});