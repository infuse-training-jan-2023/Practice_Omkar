const express = require("express");
const cors = require('cors');
var bodyParser = require('body-parser');

const PORT = 3001;
const app = express();

app.use(cors())
app.use(bodyParser.json())

app.get("/api", (req, res) => {
	res.json({ message: "Hello world!" });
});

app.listen(PORT, () => {
  	console.log(`Server listening on ${PORT}`);
});