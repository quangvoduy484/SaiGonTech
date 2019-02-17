import { Injectable } from '@angular/core';
import { Catalog } from 'src/app/Catalog';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class CatalogService {

 public Catalog: Catalog;
  ListCatalog: Catalog[] = [];
  readonly url= "https://localhost:44332/api";
  constructor(private http: HttpClient) { }

  AddCatalog(CatalogItem: Catalog)
  {
     return this.http.post(this.url + '/Catalog', CatalogItem);
  }



}
