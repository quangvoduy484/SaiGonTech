import { Component, OnInit, ViewChild } from '@angular/core';
import { Majors, ExamSubjects, ScoreofexamsubjectService } from 'src/app/services/scoreofexamsubject.service';
import { ModalDirective } from 'ngx-bootstrap';
import { Title } from '@angular/platform-browser';

@Component({
  selector: 'app-scoreofexamsubject',
  templateUrl: './scoreofexamsubject.component.html',
  styleUrls: ['./scoreofexamsubject.component.css']
})
export class ScoreofexamsubjectComponent implements OnInit {

    // Major
    majors: Majors[] = [];
    major: Majors = {} as Majors;
    // ExamSubject
    examSubjects: ExamSubjects[] = [];
    examSubject: ExamSubjects = {} as ExamSubjects;
    //
    majorSelect: string;
    // View Major
    @ViewChild('modalAddMajor') public modalAddMajor: ModalDirective;
    @ViewChild('modalEditMajor') public modalEditMajor: ModalDirective;
    @ViewChild('modalDeleteMajor') public modalDeleteMajor: ModalDirective;
    @ViewChild('modalDetailMajor') public modalDetailMajor: ModalDirective;
    // View ExamSubject
    @ViewChild('modalAddExamSubject') public modalAddExamSubject: ModalDirective;
    @ViewChild('modalEditExamSubject') public modalEditExamSubject: ModalDirective;
    @ViewChild('modalDeleteExamSubject') public modalDeleteExamSubject: ModalDirective;
    @ViewChild('modalDetailExamSubject') public modalDetailExamSubject: ModalDirective;

    constructor(private titleService: Title, private scoreOfExamSubjectService: ScoreofexamsubjectService) { }
    ngOnInit() {
      this.titleService.setTitle('ScoreOfExamSubject');
      this.loadData();
    }
    // load data address
  public loadData() {
    this.dataExamSubject();
  }

  // load data exam Subject
  public dataExamSubject() {
    this.scoreOfExamSubjectService.getAllExamSubject().subscribe(examSub => {
      console.log(examSub);
      this.examSubjects = examSub.data;
    });
  }

  // load data major
  public dataMajor() {
    this.scoreOfExamSubjectService.getAllMajors().subscribe(mj => {
      console.log(mj);
      this.majors = mj.data;
    });
  }

  public dataExamSubjectByMajor() {
    this.scoreOfExamSubjectService.getExamSubjectByMajor(this.dataMajor.name).subscribe(result => {
      console.log(result);
      this.examSubjects = result.data;
    });
  }

  // show modal Exam Subject
  ShowModalAddExamSubject() {
    this.examSubject = {} as ExamSubjects;
    this.major = {} as Majors;
    this.modalAddExamSubject.show();
  }

  ShowModalEditExamSubject(id) {
    this.scoreOfExamSubjectService.getExamSubjectById(id).subscribe(result => {
      console.log(result);
      this.examSubject = result.data;
      this.modalEditExamSubject.show();
    });
  }

  ShowModalDeleteExamSubject(id) {
    this.scoreOfExamSubjectService.getExamSubjectById(id).subscribe(result => {
      console.log(result);
      this.examSubject = result.data;
      this.modalDeleteExamSubject.show();
    });
  }
// show modal major
  ShowModalAddMajor() {
    this.major = {} as Majors;
    this.modalAddMajor.show();
  }

  ShowModalEditMajor(id) {
    alert(this.examSubject.Id);
    this.scoreOfExamSubjectService.getMajorId(id).subscribe(result => {
      console.log(result);
      this.major = result.data;
      this.modalEditMajor.show();
    });
  }

  ShowModalDeleteMajor(id) {
    this.scoreOfExamSubjectService.getMajorId(id).subscribe(result => {
      console.log(result);
      this.major = result.data;
      this.modalDeleteMajor.show();
    });
  }
  // event Exam Subject
  addExamSubject() {
  const param = {
    major_Id: this.major.Id,
    ExamSubject: this.examSubject.ExamName,
  };
  this.scoreOfExamSubjectService.addExamSubject(param).subscribe(result => {
    console.log(result);
    this.dataExamSubject();
    this.dataExamSubjectByMajor();
    this.modalAddExamSubject.hide();
  });
}

  updateExamSubject(id){
    this.scoreOfExamSubjectService.updateExamSubject(this.examSubject).subscribe(result =>{
      this.dataExamSubject();
      this.modalEditExamSubject.hide();
    })
  }

  deleteExamSubject(id){
    this.scoreOfExamSubjectService.deleteExamSubject(id).subscribe(result => {
      if (result.errorCode === 1) {
        const deleteExamSubject = this.examSubjects.find(x => x.Id === id);
        console.log(deleteExamSubject);
        if (deleteExamSubject) {
          const index = this.examSubjects.indexOf(deleteExamSubject);
          this.examSubjects.splice(index, 1);
        }
        this.modalDeleteExamSubject.hide();
      }
    });
  }

// event Major
addMajor() {
  this.scoreOfExamSubjectService.addMajor(this.major).subscribe(result => {
    this.dataMajor();
    this.modalAddMajor.hide();
  });
}

updateMajor(id) {
  this.scoreOfExamSubjectService.updateMajor(this.major).subscribe(result => {
    console.log(result);
    this.dataExamSubjectByMajor();
    this.modalEditMajor.hide();
  });
}

deleteMajor(id) {
  this.scoreOfExamSubjectService.deleteMajor(id).subscribe(result => {
    if (result.errorCode === 1) {
      const deleteMajor = this.majors.find(x => x.Id === id);
      console.log(deleteMajor);
      if (deleteMajor) {
        const index = this.majors.indexOf(deleteMajor);
        this.majors.splice(index, 1);
      }
      this.modalDeleteMajor.hide();
    }
  });
}
// event close
  close() {
    this.modalAddExamSubject.hide();
    this.modalEditExamSubject.hide();
    this.modalDeleteExamSubject.hide();

    this.modalAddMajor.hide();
    this.modalEditMajor.hide();
    this.modalDeleteMajor.hide();
  }

}
