import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { ApiService } from './api.service';
import { Observable } from 'rxjs';


export interface ListSemeterepone
{
  errorcode:number;
  errormessage: string;
  data: Semeterepone[]
}

export interface Semeterepone
{
     id: number;
     semeter_name: string;
     token: string
}
@Injectable({
  providedIn: 'root'
})
export class SemeterService {

  constructor(private http:HttpClient,private api:ApiService) {}

    public GetAllSemeter(): Observable<ListSemeterepone>
    {
       return this.http.get<ListSemeterepone>(this.api.apiUrl.semeter);
    }
    

}

