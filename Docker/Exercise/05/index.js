const express = require('express')
const app = express()
const port = process.env.PORT

app.get('/', (req, res) => {
	str = '{"name": "Omkar", "age": 23}'
	res.json(JSON.parse(str));
})

app.listen(port, () => {
	console.log(`Listening on port ${port}`);
})

// docker run -p 3000:3000 --name prob5 omkar/prob05