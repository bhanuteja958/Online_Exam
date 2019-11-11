import { Router,ActivatedRoute } from '@angular/router';
import { Component, OnInit } from '@angular/core';
import { ExamService } from '../services/exam.service';
import { Question } from '../services/models/question.model';
import {FormGroup,FormBuilder,FormControl,Validators} from '@angular/forms'
import { Answer } from '../services/models/answer.model';
@Component({
  selector: 'app-question',
  templateUrl: './question.component.html',
  styleUrls: ['./question.component.css']
})
export class QuestionComponent implements OnInit {
  sub_id: string;
  questions: Question[];
  title: string;
  myForm : FormGroup;
  answers_user: string[] = new Array(10);
  answers_db: Answer[];
  i: number;
  score: number=0;

  constructor(private exam:ExamService,
    private activatedRoute:ActivatedRoute,
    private router:Router,
    private fb:FormBuilder) {
    this.getParameters();
    this.myForm = this.fb.group({
    });
   }
   onSubmit( form: FormGroup ){
      //counting score
       for(this.i=0;this.i<this.questions.length;this.i++){
         if(this.answers_user[this.i]===this.answers_db[this.i].answer){
           this.score++;
         }
        }
        localStorage.setItem("answers",JSON.stringify(this.answers_user));
        this.router.navigate([`/result/${this.score}/${this.sub_id}`]);
       
   }
   
   onChange(i:number,event){
     this.answers_user[i] = event.target.value;
   }

   getParameters(){
    this.sub_id = this.activatedRoute.snapshot.paramMap.get("sub_id");
    switch(this.sub_id){
      case "1ng": this.title = "Angular";
                  break;
      case "1cs": this.title = "Cascading Style Sheets";
                  break;
      case "2md": this.title = "MongoDB";
                  break;
      case "2nj": this.title = "NodeJs";
                  break;
      default: this.title = "";
               break;
    }

   }

  ngOnInit() {
    this.exam.getQuestions(this.sub_id).subscribe((data: Question[])=> this.questions = data);
    this.exam.getAnswers(this.sub_id).subscribe((data:Answer[])=>this.answers_db = data)
  }

}
