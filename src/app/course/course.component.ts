import { Component, OnInit } from '@angular/core';
import {ExamService} from '../services/exam.service';
import {Course} from '../services/models/course.model';
import { Router } from '@angular/router';


@Component({
  selector: 'app-course',
  templateUrl: './course.component.html',
  styleUrls: ['./course.component.css']
})
export class CourseComponent implements OnInit {
   courses: Course[];
   text: string;
   id: number;
   i: number;

  constructor(private exam: ExamService,public router: Router) { }

  // goto subjects

  onClick(event) {
    this.text = event.target.text;
    for(this.i=0;this.i<this.courses.length;this.i++){
      if(this.courses[this.i].course === this.text){
        this.id = this.courses[this.i].course_id;
      }
    }
    this.router.navigate(["/courses/subjects/"+this.id])

  }

  ngOnInit() {
    this.exam.getCourses().subscribe((data: Course[]) => this.courses = data );
  }

}
