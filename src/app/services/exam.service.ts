import { Injectable } from '@angular/core';
import {HttpClient, HttpResponse} from '@angular/common/http';
import {Observable} from 'rxjs';
import {Course} from './models/course.model';
import {Subject} from './models/subject.model';
import { Question } from './models/question.model';
import { Answer } from './models/answer.model';
import { User } from './models/user.model';
import { Score } from './models/score.model';
import { ScoreDB } from './models/score_db.model';

@Injectable({
  providedIn: 'root'
})
export class ExamService {

constructor( private http: HttpClient) { }
    // get courses from database

getCourses(): Observable<Course[]> {
return this.http.get<Course[]>('/api/courses');
}
// get subjects from database

getSubjects(id: string): Observable<Subject[]> {
return this.http.get<Subject[]>("/api/courses/subjects/"+id);
}

//get questions from database
getQuestions(sub_id: string): Observable<Question[]> {
return this.http.get<Question[]>("/api/courses/subjects/questions/"+sub_id);
}

//get answers from database
getAnswers(sub_id:string): Observable<Answer[]>{
  return this.http.get<Answer[]>("/api/courses/subjects/answers/"+sub_id);
}

//insert user into database
insertUser(user: User): Observable<User>{
  return this.http.post<User>("/api/register",user);
}
//insert score into database
insertScore(score: Score): Observable<Score>{
  return this.http.put<Score>("/api/score",score);
}

//get score from database
getScore(sub_name:string,user_id:number): Observable<ScoreDB[]>{
  return this.http.get<ScoreDB[]>(`/api/score/${user_id}/${sub_name}`);
}

//get average from database
getAverage(course:string,reg_id:number): Observable<any[]>{
  return this.http.get<any[]>(`/api/average/${course}/${reg_id}`);
}

}
