import { Component, OnInit, ViewChild } from '@angular/core';
import { ExSubject, ExamsubjectService } from '../../services/examsubject.service';
import { ModalDirective } from 'ngx-bootstrap';
import { Title } from '@angular/platform-browser';

@Component({
  selector: 'app-examsubject',
  templateUrl: './examsubject.component.html',
  styleUrls: ['./examsubject.component.css']
})
export class ExamsubjectComponent implements OnInit {

  exsubjects: ExSubject[] =[];
  exsubject: ExSubject = {} as ExSubject;

  @ViewChild('modalAdd') public modalAdd: ModalDirective;
  @ViewChild('modalEdit') public modalEdit: ModalDirective;
  @ViewChild('modalDelete') public modalDelete: ModalDirective;
  @ViewChild('modalDetail') public modalDetail: ModalDirective;
  
  constructor(private titleService: Title, private exsubjectService: ExamsubjectService) { }

  ngOnInit() {
    this.titleService.setTitle("Exam Subject");
    this.loadData();
  }

  public loadData(){
    this.exsubjectService.getAllExSubject().subscribe(result =>{
      console.log(result);
      this.exsubjects = result.data;
    })
  }

  ShowModalAdd(){
    this.exsubject = {} as ExSubject;
    this.modalAdd.show();
  }

  ShowModalEdit(event = null, id){
    event.preventDefault();
    this.exsubjectService.getExSubjectId(id).subscribe(result =>{
      console.log(result);
      this.exsubject = result.data;
      this.modalEdit.show();
    });
  }

  ShowModalDelete(event = null, id){
    event.preventDefault();
    this.exsubjectService.getExSubjectId(id).subscribe(result =>{
      console.log(result);
      this.exsubject = result.data;
      this.modalDelete.show();
    });
  }

  add(){
    this.exsubjectService.add(this.exsubject).subscribe(result =>{
      console.log(result);
      this.loadData();
      this.modalAdd.hide();
    });
  }

  update(id){
    this.exsubjectService.update(this.exsubject).subscribe(result =>{
      this.loadData();
      this.modalEdit.hide();
    });
  }

  delete(id){
    this.exsubjectService.delete(id).subscribe(result =>{
      if(result.errorCode === 1){
        const deleteExSubject = this.exsubjects.find(x => x.id === id);
        console.log(deleteExSubject);
        if(deleteExSubject){
          const index = this.exsubjects.indexOf(deleteExSubject);
          this.exsubjects.splice(index, 1);
        }
        this.modalDelete.hide();
      }
    });
  }

  close(){
    this.loadData();
    this.modalAdd.hide();
    this.modalDetail.hide();
    this.modalEdit.hide();
    this.modalDelete.hide();
  }

  ShowModalDetail(event = null, id){
    event.preventDefault();
    this.exsubjectService.getExSubjectId(id).subscribe(result =>{
      console.log(result);
      this.exsubject = result.data;
      this.modalDetail.show();
    });
  }
}
