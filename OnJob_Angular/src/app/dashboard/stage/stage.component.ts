import { Component, OnInit, ViewChild } from '@angular/core';
import { Stage, StageService, Semester, Year } from '../../services/stage.service';
import { ModalDirective } from 'ngx-bootstrap';
import { Title } from '@angular/platform-browser';

@Component({
  selector: 'app-stage',
  templateUrl: './stage.component.html',
  styleUrls: ['./stage.component.css']
})
export class StageComponent implements OnInit {

  stages: Stage[] = [];
  stage: Stage = {} as Stage;

  semesters: Semester[] = [];
  semester: Semester = {} as Semester;

  years: Year[] = [];
  year: Year = {} as Year;

  @ViewChild('modalAdd') public modalAdd: ModalDirective;
  @ViewChild('modalEdit') public modalEdit: ModalDirective;
  @ViewChild('modalDelete') public modalDelete: ModalDirective;
  @ViewChild('modalDetail') public modalDetail: ModalDirective;
  constructor(private titleService: Title, private stageService: StageService) { }

  ngOnInit() {
    this.titleService.setTitle("Stage");
    this.loadData();
  }

  public loadData(){
    this.stageService.getAllStage().subscribe(result =>{
      console.log(result);
      this.stages = result.data;
    })
  }

  ShowModalAdd(){
    this.stage = {} as Stage;
    this.modalAdd.show();
  }

  ShowModalEdit(event = null, id){
    event.preventDefault();
    this.stageService.getStageId(id).subscribe(result =>{
      console.log(result);
      this.stage = result.data;
      this.modalEdit.show();
    })
  }

  ShowModalDelete(event = null, id){
    event.preventDefault();
    this.stageService.getStageId(id).subscribe(result =>{
      console.log(result);
      this.stage = result.data;
      this.modalDelete.show();
    })
  }

  add() {
    this.stageService.add(this.stage).subscribe(result => {
      console.log(result);
      this.loadData();
      this.modalAdd.hide();
    });
  }

  update(id){
    this.stageService.update(this.stage).subscribe(result =>{
      this.loadData();
      this.modalEdit.hide();
    })
  }

  delete(id){
    this.stageService.delete(id).subscribe(result =>{
      if(result.errorCode === 0){
        const deleteStage = this.stages.find(x => x.id === id);
        console.log(deleteStage);
        if(deleteStage){
          const index = this.stages.indexOf(deleteStage);
          this.stages.splice(index, 1);
        }
        this.modalDelete.hide();
      }
    })
  }

  close(){
    this.loadData();
    this.modalAdd.hide();
    this.modalDetail.hide();
    this.modalEdit.hide();
    this.modalDelete.hide();
  }
  ShowModalDetail(event = null, id) {
    event.preventDefault();
    this.stageService.getStageId(id).subscribe(result => {
      console.log(result);
      this.stage = result.data;
      this.modalDetail.show();
    });
  }

}
