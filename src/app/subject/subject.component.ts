import { Subject } from './../services/models/subject.model';
import { ExamService } from './../services/exam.service';
import { Component, OnInit } from '@angular/core';
import { Router,ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-subject',
  templateUrl: './subject.component.html',
  styleUrls: ['./subject.component.css']
})
export class SubjectComponent implements OnInit {

  subjects: Subject[];
  text: string;
  i: number;
  id: string;
  sub_id: string;

  constructor(private exam: ExamService,
    private activatedRoute: ActivatedRoute,
    private router: Router) { 
      this.id = this.activatedRoute.snapshot.paramMap.get('id');
    }
    onClick(event){
      this.text = event.target.text;
    for(this.i=0;this.i<this.subjects.length;this.i++){
      if(this.subjects[this.i].sub_name === this.text){
        this.sub_id= this.subjects[this.i].sub_id;
      }
    }
    this.router.navigate(["/courses/subjects/questions/"+this.sub_id])
    }

  ngOnInit() {
      this.exam.getSubjects(this.id).subscribe((data: Subject[]) => this.subjects=data);
  }
 
}
