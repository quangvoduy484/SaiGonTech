import { Component, OnInit } from '@angular/core';
import { SemeterService, Semeterepone } from 'src/app/services/semeter.service';

@Component({
  selector: 'app-semester',
  templateUrl: './semester.component.html',
  styleUrls: ['./semester.component.css']
})
export class SemesterComponent implements OnInit {

  constructor(private Semeters:SemeterService) {  }

  List_Semeter:Semeterepone[];
  ngOnInit() {
    this.LoadListSemeter();
  }

  LoadListSemeter()
  {
      this.Semeters.GetAllSemeter().subscribe(se => {
            if(se.errorcode == 0)
            {
                this.List_Semeter = se.data;
            }
      });
  }
  


}
