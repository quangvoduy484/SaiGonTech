import { Component, OnInit, ViewChild } from '@angular/core';
import { ScoreExam, ScoreexamService } from 'src/app/services/scoreexam.service';
import { Major, MajorService } from 'src/app/services/major.service';
import { ExSubject, ExamsubjectService } from 'src/app/services/examsubject.service';
import { ModalDirective } from 'ngx-bootstrap';
import { Title } from '@angular/platform-browser';

@Component({
  selector: 'app-scoreofexamsubject',
  templateUrl: './scoreofexamsubject.component.html',
  styleUrls: ['./scoreofexamsubject.component.css']
})
export class ScoreofexamsubjectComponent implements OnInit {

  scoreexams: ScoreExam[] = [];
  scoreexam: ScoreExam = {} as ScoreExam;

  majors: Major[] = [];
  major: Major = {} as Major;

  examsubjects: ExSubject[] = [];
  examsubject: ExSubject = {} as ExSubject;
  
  @ViewChild('modalAdd') public modalAdd: ModalDirective;
  @ViewChild('modalEdit') public modalEdit: ModalDirective;
  @ViewChild('modalDelete') public modalDelete: ModalDirective;
  @ViewChild('modalDetail') public modalDetail: ModalDirective;
  constructor(private titleService: Title, private majorSevice: MajorService, private exsubjectService: ExamsubjectService, private scoreexamService: ScoreexamService) { }

  ngOnInit() {
    this.titleService.setTitle("Passing Score Subject");
    this.loadData();
    this.dataMajor();
    this.dataExamSubject();
  }

  //load data score exam
  public loadData(){
    this.scoreexamService.getAllScoreExam().subscribe(result =>{
      console.log(result);
      this.scoreexams = result.data;
    });
  }

  public dataScoreExamById(id){
    this.scoreexamService.getScoreExamId(id).subscribe(result =>{
      console.log(result);
      this.scoreexam = result.data;
    });
  }

  //load data major
  public dataMajor(){
    this.majorSevice.getAllMajor().subscribe(result =>{
      console.log(result);
      this.majors = result.data;
    });
  }

  //load data exam subject
  public dataExamSubject(){
    this.exsubjectService.getAllExSubject().subscribe(result =>{
      console.log(result);
      this.examsubjects = result.data;
    });
  }

  // show modal Score Exam
  ShowModalAdd() {
    this.scoreexam = {} as ScoreExam;
    this.modalAdd.show();
  }

  ShowModalEdit(event = null, id) {
    event.preventDefault();
    this.dataScoreExamById(id);
    this.modalEdit.show();
  }

  ShowModalDelete(event = null, id) {
    event.preventDefault();
    this.dataScoreExamById(id);
    this.modalDelete.show();
  }

  ShowModalDetail(event = null, id) {
    event.preventDefault();
    this.dataScoreExamById(id);
    this.modalDetail.show();
  }

  // event Score Exam
  add() {
    const param = {
      sumScore: this.scoreexam.sumScore,
      scorePass: this.scoreexam.scorePass,
      exaM_ID: this.examsubject.id,
      majoR_ID: this.major.id
    }
    this.scoreexamService.add(param).subscribe(result => {
      console.log(result);
      this.loadData();
      this.modalAdd.hide();
    });
  }

  update(id) {
    this.scoreexamService.update(this.scoreexam).subscribe(result => {
      console.log(result);
      this.loadData();
      this.modalEdit.hide();
    })
  }

  delete(id) {
    this.scoreexamService.delete(id).subscribe(result => {
      if (result.errorCode === 0) {
        const deleteScoreExam = this.scoreexams.find(x => x.id === id);
        console.log(deleteScoreExam);
        if (deleteScoreExam) {
          const index = this.scoreexams.indexOf(deleteScoreExam);
          this.scoreexams.splice(index, 1);
        }
        this.modalDelete.hide();
      }
    });
  }

  // event lose
  close() {
    this.loadData();
    this.modalAdd.hide();
    this.modalDetail.hide();
    this.modalEdit.hide();
    this.modalDelete.hide();
  }

}
