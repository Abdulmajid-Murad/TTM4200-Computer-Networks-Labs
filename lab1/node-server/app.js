const express = require("express");
const app = express();
const fs = require('fs');

app.set("views", __dirname + "/views");
app.use(express.static('views'));

app.get("/", function(req, res){
	res.sendFile("/app/index.html");
	console.log("Someone accessed the home page!");
})

app.listen(8080, function() {
	console.log("App is running on port 8080!");
})
