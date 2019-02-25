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

  constructor(private Semeters: SemeterService) { }
  @ViewChild('Modal') modal: ModalDirective;

 // List_Semeter: Semeterepone[];
  ngOnInit() {
    this.loadSemeter();
  }

  loadSemeter() {
    this.Semeters.getAll().subscribe(se => {
        if(se.errorcode === 0 )
        {
            for(let seme of se.data)
            {
                  this.semeter = {} as Semeter;
                  this.semeter.id= seme.id;
                  this.semeter.semeter_name=seme.semeter_name;
                  this.semeters.push(this.semeter);
            }
        }
    });
  }



}
