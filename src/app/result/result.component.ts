
import { ExamService } from './../services/exam.service';
import { ActivatedRoute, Router } from '@angular/router';
import { Component, OnInit } from '@angular/core';
import { Answer } from '../services/models/answer.model';
import { Question } from '../services/models/question.model';
import { User } from '../services/models/user.model';
import { Score } from '../services/models/score.model';

@Component({
  selector: 'app-result',
  templateUrl: './result.component.html',
  styleUrls: ['./result.component.css']
})
export class ResultComponent implements OnInit {
    //properties used in the component
    sub: string;
    result: any;
    sub_id: string;
    score: string;
    answers_user: string[];
    answers_db: Answer[];
    questions: Question[];
    correctAnswers: string[] = new Array(10);
    wrongAnswers:string[] = new Array(10);
    i:number;
    checkAnswers: boolean = false;
    user: any;
    score_db:Score={
      sub:undefined,
      reg_id:undefined,
      score:undefined
    }


  constructor(
    private activatedRoute: ActivatedRoute,
    private exam:ExamService,
    private router:Router
    ) {
      this.sub_id = this.activatedRoute.snapshot.paramMap.get("sub_id");
      this.score = this.activatedRoute.snapshot.paramMap.get("score");
      switch(this.sub_id){
        case "1cs": this.sub = "css";
                    break;
        case "1ng": this.sub = "angular";
                    break;
        case "2nj": this.sub = "nodejs";
                    break;
        case "2md": this.sub = "mongodb";
                    break;

      }
   }

   onClick(){
      this.router.navigate(['/courses']);
   }

   //getting correct answers from database
   getCorrectAnswers(){
     this.checkAnswers=true;
     for(this.i=0;this.i<this.questions.length;this.i++){
       if(this.answers_user[this.i]===this.answers_db[this.i].answer){
           this.correctAnswers[this.i] = this.answers_user[this.i];
       }
       else{
         this.correctAnswers[this.i] = this.answers_db[this.i].answer;
         this.wrongAnswers[this.i] = this.answers_user[this.i];
        }
     }
   }

   //submitting score to database
   submitScore(){
      this.user = JSON.parse(localStorage.getItem("user"));
      this.score_db.reg_id = this.user.reg_id;
      this.score_db.score = parseInt(this.score);
      this.score_db.sub = this.sub;   
      console.log(this.score_db);
      this.exam.insertScore(this.score_db).subscribe((data:any)=>{
        this.result = data;
      });
      this.router.navigate(["/courses"])
   }

   //check if answer is correct
   checkIfCorrect(i: number,option: string){
     if(this.correctAnswers[i] === option){
       return true;
     }
     else{
       return false;
     }
   }

   //check if answer is wrong
   checkIfWrong(i: number,option: string){
    if(this.wrongAnswers[i] === option){
      return true;
    }
    else{
      return false;
    }
  }

  ngOnInit() {
      this.exam.getAnswers(this.sub_id).subscribe((data: Answer[])=>this.answers_db=data);
      this.exam.getQuestions(this.sub_id).subscribe((data:Question[])=>this.questions = data);
      this.answers_user = JSON.parse(localStorage.getItem("answers"));
  }

  


}
