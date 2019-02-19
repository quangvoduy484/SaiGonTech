import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { DataTablesModule } from 'angular-datatables';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { AlertModule, ButtonsModule, BsDropdownModule } from 'ngx-bootstrap';
import { HeaderComponent } from './header/header.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { CandidateComponent } from './dashboard/candidate/candidate.component';
import { EducationComponent } from './dashboard/education/education.component';
import { DocumentComponent } from './dashboard/document/document.component';
import { ParameterComponent } from './dashboard/parameter/parameter.component';
import { IntakeComponent } from './dashboard/intake/intake.component';
import { CatalogComponent } from './dashboard/catalog/catalog.component';
import { YearComponent } from './dashboard/year/year.component';
import { SemesterComponent } from './dashboard/semester/semester.component';
import { StageComponent } from './dashboard/stage/stage.component';
import { AddressComponent } from './dashboard/address/address.component';
import { MajorComponent } from './dashboard/major/major.component';
import { CandidatetypeComponent } from './dashboard/candidatetype/candidatetype.component';
import { ExamsubjectComponent } from './dashboard/examsubject/examsubject.component';
import { ScoreofexamsubjectComponent } from './dashboard/scoreofexamsubject/scoreofexamsubject.component';
import { StagedetailComponent } from './dashboard/stagedetail/stagedetail.component';
import { LoginComponent } from './login/login.component';

@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    DashboardComponent,
    CandidateComponent,
    EducationComponent,
    DocumentComponent,
    ParameterComponent,
    IntakeComponent,
    CatalogComponent,
    YearComponent,
    SemesterComponent,
    StageComponent,
    AddressComponent,
    MajorComponent,
    CandidatetypeComponent,
    ExamsubjectComponent,
    ScoreofexamsubjectComponent,
    StagedetailComponent,
    LoginComponent
  ],
  imports: [
    DataTablesModule,
    AlertModule.forRoot(),
    ButtonsModule.forRoot(),
    BsDropdownModule.forRoot(),
    BrowserModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
