import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule } from '@angular/common/http';
import {ReactiveFormsModule,FormsModule} from '@angular/forms'


import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { CourseComponent } from './course/course.component';
import {ExamService} from './services/exam.service';
import { HomeComponent } from './home/home.component';
import { SubjectComponent } from './subject/subject.component';
import { QuestionComponent } from './question/question.component';
import { ResultComponent } from './result/result.component';
import { RegisterComponent } from './register/register.component';

@NgModule({
  declarations: [
    AppComponent,
    CourseComponent,
    HomeComponent,
    SubjectComponent,
    QuestionComponent,
    ResultComponent,
    RegisterComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    ReactiveFormsModule,
    FormsModule
  ],
  providers: [ExamService],
  bootstrap: [AppComponent]
})
export class AppModule { }
