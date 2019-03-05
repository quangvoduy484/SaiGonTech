import { Component, OnInit, ViewChild } from '@angular/core';
import { ParameterService, Parameter } from 'src/app/services/parameter.service';
import { Year, YearService } from 'src/app/services/year.service';
import { Semester, SemesterService } from 'src/app/services/semester.service';
import { Intake, IntakeService } from 'src/app/services/intake.service';
import { ModalDirective } from 'ngx-bootstrap';
import { Title } from '@angular/platform-browser';

@Component({
  selector: 'app-parameter',
  templateUrl: './parameter.component.html',
  styleUrls: ['./parameter.component.css']
})
export class ParameterComponent implements OnInit {

  parameter: Parameter = {} as Parameter;

  year: Year = {} as Year;
  years: Year[] = [];

  semesters: Semester[] = [];
  semester: Semester = {} as Semester;

  intake: Intake = {} as Intake;
  intakes: Intake[] = [];


  @ViewChild('modal') modal: ModalDirective;
  constructor(private parameterservice: ParameterService, private semeterservice: SemesterService, private yearservice: YearService, private intakeserviece: IntakeService, private titleService: Title) { }

  ngOnInit() {
    this.titleService.setTitle("Parameter");
    this.Load();

    this.getSemeter();
    this.getIntake();
    this.getYear();
  }

  Load() {
    this.parameterservice.getAll().subscribe(para => {
      console.log(para.data);
      this.parameter = para.data;
      console.log(this.parameter);
      console.log(this.parameter.semid);
      console.log(this.parameter.intakeid);

      this.getNameSemeter();

      this.getNameYear();

      this.getNameIntake();
    });
  }

  getNameSemeter() {
    this.semeterservice.getSemesterId(this.parameter.semid).subscribe(seme => {
      console.log(this.parameter.semid);
      this.semester = seme.data;
    });
  }

  getNameYear() {
    this.yearservice.getYearId(this.parameter.yearid).subscribe(year => {
      this.year = year.data;
    });
  }

  getNameIntake() {
    this.intakeserviece.getIntakeId(this.parameter.intakeid).subscribe(intake => {
      this.intake = intake.data;
    });
  }
  public getSemeter() {
    this.semeterservice.getAllSemester().subscribe(seme => {



      this.semesters = seme.data;
      console.log(this.semesters);


    });
  }
  public getYear() {
    this.yearservice.getAllYear().subscribe(year => {

      this.years = year.data;
      console.log(this.years);


    });
  }
  public getIntake() {
    this.intakeserviece.getAllIntake().subscribe(intake => {

      this.intakes = intake.data;
      console.log(this.intakes);
    });
  }
  showModel(event = null) {
    if (event) {
      event.preventDefault();
    }
    this.modal.show();
  }
}
