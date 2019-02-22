import { Injectable } from '@angular/core';
import { ApiService } from './api.service';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface YearList{
  YearInfo();
}
export interface YearInfo{
  id: number;
  yearName: number;
}
export interface YearDetails{
  yearName: number;
}
@Injectable({
  providedIn: 'root'
})
export class YearService {

  constructor(private api:ApiService, private http: HttpClient) { }
  public getAllyear(): Observable<YearList>{
    return this.http.get<YearList>(this.api.apiUrl.years);
  }

  public getYearId(id): Observable<YearDetails>{
    return this.http.get<YearDetails>(this.api.apiUrl.yeardetail + "/" + id)
  }
}
