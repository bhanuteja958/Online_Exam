import { User } from './../services/models/user.model';
import { Router } from '@angular/router';
import { ExamService } from './../services/exam.service';
import { Component, OnInit } from '@angular/core';
import {FormBuilder,FormControl,FormGroup,Validators} from '@angular/forms';
@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {
  myForm: FormGroup;
  user: User = {
    reg_id:undefined,
    reg_name:undefined,
    reg_email:undefined
  }
  result : User;
  constructor(
    private fb:FormBuilder,
    private exam:ExamService,
    private router:Router) {
     this.myForm  = this.fb.group({
       userName:['',[Validators.required]],
       email:['',[Validators.required]]
     });
   }
  
  onSubmit(form: FormGroup){
    this.user.reg_id = Math.floor(Math.random()*10000000);
    this.user.reg_name = form.value.userName;
    this.user.reg_email = form.value.email;
    localStorage.setItem("user",JSON.stringify(this.user));
    this.exam.insertUser(this.user).subscribe((data:User)=> this.result = data).unsubscribe();
    this.router.navigate(["/courses"]);
  }

  ngOnInit() {

  }

}
