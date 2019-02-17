import { Component, OnInit } from '@angular/core';
import { CatalogService } from 'share/catalog.service';
import { HttpClient } from '@angular/common/http';
import { Catalog } from 'src/app/Catalog';
@Component({
  selector: 'app-catalog',
  templateUrl: './catalog.component.html',
  styleUrls: ['./catalog.component.css']
})
export class CatalogComponent implements OnInit {

  
  public Begin_year: number;
  public End_year: number;
  constructor(private CatalogService: CatalogService, private http: HttpClient) { }
  catalog: Catalog;
  receviedata():void
  {
      this.catalog.beginYear = this.Begin_year;
      this.catalog.endYear = this.End_year;
  }
 
  
  
  ngOnInit() {
    
      this.receviedata();
    
  }
  Add()
  {
      this.CatalogService.AddCatalog(this.CatalogService.Catalog).subscribe(value =>{
          console.log("Thành Cônng");
      });
  }

}
