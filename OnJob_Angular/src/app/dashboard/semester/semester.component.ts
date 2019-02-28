import { Component, OnInit, ViewChild } from '@angular/core';
import { SemeterService, Semeterepone, Semeter } from 'src/app/services/semeter.service';

import { BsModalService, BsModalRef, ModalDirective } from 'ngx-bootstrap/modal';

@Component({
  selector: 'app-semester',
  templateUrl: './semester.component.html',
  styleUrls: ['./semester.component.css']
})
export class SemesterComponent implements OnInit {

  modalRef: BsModalRef;
  semeters: Semeter[] = [];
  semeter: Semeter = {} as Semeter;
  status: string;

  constructor(private semeterService: SemeterService) { }
  @ViewChild('Modal') modal: ModalDirective;

  // List_Semeter: Semeterepone[];
  ngOnInit() {
    this.loadSemeter();
  }

  loadSemeter() {
    this.semeterService.getAll().subscribe(se => {
      if (se.errorcode === 0) {
        for (let seme of se.data) {
          this.semeter = {} as Semeter;

          this.semeter.id = seme.id;
          this.semeter.semeter_name = seme.semeter_name;
          // do no push then semeter hiện tại vào cuối danh sách mảng
          this.semeters.push(this.semeter);


        }
      }
    });
  }

  show(event, id: number = 0) {
    if (event) {
      event.preventDefault();
    }
    if (id > 0) {
      this.semeterService.get(id).subscribe(se => {
        this.semeter = {} as Semeter;

        this.semeter.id = se.data['id'];
        this.semeter.semeter_name = se.data['semeter_name'];
        this.status="Edit Semeter";
        this.modal.show();

      });
    }
    else {
      // phai co dong nay chu ko no nho lai semeter da edit 

      this.semeter = {} as Semeter;
      this.status= "New Semeter";
      this.modal.show();
    }
    this.modal.show();

  }


  save() {
    console.log(this.semeter);
    if (this.semeter.id == undefined || this.semeter.id === 0) {
      this.semeterService.Add(this.semeter).subscribe(se => {
        if (se.errorcode === 0) {
          this.semeter = {} as Semeter;
          this.semeter.id = se.data['id'];
          this.semeter.semeter_name = se.data['semeter_name'];
          this.semeters.push(this.semeter);
          this.modal.hide();
        } else {
          console.log("Thêm thất bại");
        }
      });

    }
    else {
      this.semeterService.Update(this.semeter).subscribe(se => {
        if (se.errorcode === 0) {
          this.semeters.find(s => s.id == se.data['id']).semeter_name = se.data['semeter_name'];
          this.modal.hide();
        }

      });


    }
  }

  delete(event, id) {
    if (event) {
      event.preventDefault();
    }
    this.semeterService.Delete(id).subscribe(se => {
      if (se.errorcode === 0) {
        const seme = this.semeters.find(s => s.id == id);
        if (seme) {
          const index = this.semeters.indexOf(seme);
          this.semeters.splice(index, 1);
        }
      }


    });
  }









}
