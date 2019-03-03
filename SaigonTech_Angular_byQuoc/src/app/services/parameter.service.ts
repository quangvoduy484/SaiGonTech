import { Injectable } from '@angular/core';
import { ApiService } from './api.service';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { YearDetail, YearService } from './year.service';

export interface Parameterepone {
  errorCode: number;
  messege: string;
  data: Parameter;
}

export interface Parameter {

  id: number;
   singaturename: string;
   morecontact: string;
   documentcode: string;
   yearid: number;
   semid: number;
   intakeid: number;
}


@Injectable({
  providedIn: 'root'
})
export class ParameterService {


  constructor(private api: ApiService, private http: HttpClient) { }

  getAll(): Observable<Parameterepone> {
    return this.http.get<Parameterepone>(this.api.apiUrl.parameter);
  }

}
