import { Component, OnInit } from '@angular/core';
import { Title } from '@angular/platform-browser';
import { YearService, YearList, YearDetails } from 'src/app/services/year.service';

@Component({
  selector: 'app-year',
  templateUrl: './year.component.html',
  styleUrls: ['./year.component.css']
})
export class YearComponent implements OnInit {

  years: YearList;
  detail: YearDetails;
  constructor(private titleService: Title, private yearService: YearService) { }

  ngOnInit() {
    this.titleService.setTitle("Year");
    this.yearService.getAllyear().subscribe(result =>{
      this.years = result;
    });
  }

  year_details(id){
    this.yearService.getYearId(id).subscribe(result =>{
      this.detail = result;
    });
  }
}
