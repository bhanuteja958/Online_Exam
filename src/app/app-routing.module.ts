import { AuthGuard } from './auth.guard';
import { RegisterComponent } from './register/register.component';
import { ResultComponent } from './result/result.component';
import { QuestionComponent } from './question/question.component';
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { CourseComponent } from './course/course.component';
import { HomeComponent } from './home/home.component';
import { SubjectComponent } from './subject/subject.component';


const routes: Routes = [
  {path: '', component: HomeComponent},
  {path: 'courses', component: CourseComponent,canActivate:[AuthGuard]},
  {path:"courses/subjects/:id",component: SubjectComponent,canActivate:[AuthGuard]},
  {path:"courses/subjects/questions/:sub_id",component: QuestionComponent,canActivate:[AuthGuard]},
  {path:"result/:score/:sub_id",component: ResultComponent,canActivate:[AuthGuard]},
  {path:"register",component:RegisterComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
