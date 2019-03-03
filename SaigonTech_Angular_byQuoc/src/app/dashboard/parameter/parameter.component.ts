import { Component, OnInit, ViewChild } from '@angular/core';
import { ParameterService, Parameter } from 'src/app/services/parameter.service';
import { Year, YearService } from 'src/app/services/year.service';
import { Semester, SemesterService } from 'src/app/services/semester.service';
import { Intake, IntakeService } from 'src/app/services/intake.service';
import { ModalDirective } from 'ngx-bootstrap';

@Component({
  selector: 'app-parameter',
  templateUrl: './parameter.component.html',
  styleUrls: ['./parameter.component.css']
})
export class ParameterComponent implements OnInit {

  parameter: Parameter = {} as Parameter;

  year: Year = {} as Year;

  semester: Semester = {} as Semester;

  intake: Intake = {} as Intake;


  @ViewChild('modal') modal: ModalDirective;
  constructor(private parameterservice: ParameterService, private semeterservice: SemesterService, private yearservice: YearService, private intakeserviece: IntakeService) { }

  ngOnInit() {
    this.Load();


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


  showModel(event = null)
  {
    if (event) {
      event.preventDefault();
    }
    this.modal.show();
  }





}
