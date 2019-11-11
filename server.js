const express = require("express");
const path = require("path");
const http = require("http");
const bodyParser = require("body-parser");
const mysql = require("mysql");
const exam = require("./server/routes/exam");


const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname,"dist/exam")));
app.use("/api",exam);


app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname, 'dist/exam/index.html'));
});

const port = process.env.PORT || 3000;
app.set("port",port);

const server = http.createServer(app);

server.listen(port,()=>{
  console.log(`listening on port ${port}`);
});


