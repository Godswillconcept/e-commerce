const express = require('express');
const fileUpload = require('express-fileupload');
const bodyParser = require('body-parser');
const adminRoute = require('./routes/adminRoute');
const clientRoute = require('./routes/clientRoute');
const app = express()
//body parser
app.use(express.static('uploads'));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.json());


//file upload
app.use(
    fileUpload({
        useTempFiles: true,
        tempFileDir: "./tmp/",
    })
);
app.use((req, res, next)=>{console.log(req.url); next()})
//admin route
app.use('/admin', adminRoute);
app.use(clientRoute)




app.get("/", (req, res) => res.send("<h1>E-commerce with mobile interface</h1>"));
const PORT = process.env.PORT || 3000;
app.listen(PORT);