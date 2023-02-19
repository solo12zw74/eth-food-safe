var express = require("express");
var fs = require("fs");
var cors = require("cors");
var path = require("path");

var app = express();
app.use(cors());
app.listen(3000);

app.get("/", function(req,res) {
    const contractPath = path.resolve(__dirname, "build","contracts","FoodSafe.json")
    var contract = fs.readFileSync(contractPath, "utf-8");
    res.status(200);
    res.send(contract);
});