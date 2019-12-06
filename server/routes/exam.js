const express = require("express");
const mysql = require("mysql");
const router = express.Router();

const db = mysql.createConnection({
  host:"localhost",
  user:"bhanu",
  password:"bhanu@123",
  database:"exam"
});

db.connect((err,result) =>{
 if(err){
   console.log("error connecting to mysql");
 }
 else{
   console.log("connected to mysql server");
 }
});

//routes for the exam

//route to get courses
router.get("/courses",(req,res)=>{
  // res.send("course works");
  let sql = "select * from courses";
  db.query(sql,(err,result)=>{
    if(err){
      console.log("error: "+err);
    }else{
      res.send(result);
    }
  })
});

//route to get subjects
router.get("/courses/subjects/:course_id",(req,res)=>{
  let course= req.params.course_id;
  let sql = `select * from subjects where course_id = ${course}`;
  db.query(sql,(err,result)=>{
    if(err){
      console.log("subject error");
      console.log("error:"+ err);
    }
    else{
      res.send(result);
    }
  })
});

//route to get questions
router.get("/courses/subjects/questions/:sub_id",(req,res)=>{
  let subject = req.params.sub_id;
  let sql = `select * from questions q where q.sub_id = '${subject}'`;
  db.query(sql,(err,result)=>{
    if(err){
      console.log("error:"+err);
    }else{
     res.send(result);
    }
  })
});

//route to get answers
router.get("/courses/subjects/answers/:sub_id",(req,res)=>{
  let subject = req.params.sub_id;
  let sql = `select * from answers a where a.sub_id = '${subject}'`;
  db.query(sql,(err,result)=>{
    if(err){
      console.log("error:"+err);
    }else{
     res.send(result);
    }
  })
});

//route to insert an user
router.post("/register",(req,res)=>{
  let user_name = req.body.reg_name;
  let email = req.body.reg_email;
  let id = req.body.reg_id;
  let sql = `insert into registration value (${id},'${user_name}','${email}')`;
  db.query(sql,(err,result)=>{
    if(err){
      console.log("error:"+err);
    }else{
     res.send(result);
    }
  })
});

//route to insert score
router.put("/score",(req,res)=>{
  let sub = req.body.sub;
  let reg_id = req.body.reg_id;
  let score = req.body.score;
  let sql = `update ${sub} set score=${score} where reg_id = ${reg_id}`;
  db.query(sql,(err,result)=>{
    if(err){
      console.log("error:"+err)
    }
    else{
      res.send(result)
    }
  })
})

//route to get score

router.get("/score/:user_id/:sub_name",(req,res)=>{
  let user_id = req.params.user_id;
  let sub_name = req.params.sub_name;
  let sql = `select * from ${sub_name} where reg_id = ${user_id}`;
  db.query(sql,(err,result)=>{
    if(err){
      console.log("error:"+err);
    }
    else{
      res.send(result);
    }
  })
})

//router to get average score

router.get("/average/:course/:reg_id",(req,res) =>{
  let course = req.params.course;
  let reg_id = req.params.reg_id;
  let sql;
  if(course == "front"){
    sql = `call avg(${reg_id})`;
  }
  else{
    sql = `call avg1(${reg_id})`;
  }
  db.query(sql,(err,result)=>{
    if(err){
      console.log("error:"+err);
    }
    else{
      res.send(result);
    }
  })
})


module.exports = router;
