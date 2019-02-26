import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { ApiService } from './api.service';
import { Observable } from 'rxjs';


export interface Semeterepones {
  errorcode: number;
  errormessage: string;
  data: Semeterepone[];
}

export interface Semeterepone {
  id: number;
  semeter_name: string;
  token: string;
}

export interface Semeter {
  id: number;
  semeter_name: string;
}
@Injectable({
  providedIn: 'root'
})
export class SemeterService {

  constructor(private http: HttpClient, private api: ApiService) { }

  public getAll(): Observable<Semeterepones> {
    return this.http.get<Semeterepones>(this.api.apiUrl.semeter);
  }

  public get(id: Number): Observable<Semeterepones>{
    return this.http.get<Semeterepones>(this.api.apiUrl.semeter_object + '/' + id);
  }

  public Add(semeter: Semeter): Observable<Semeterepones> {
    return this.http.post<Semeterepones>(this.api.apiUrl.semeter_add, semeter);
  }

  public Update(semeter :Semeter):Observable<Semeterepones>
  {
    return this.http.put<Semeterepones>(this.api.apiUrl.semeter_update + '?id=' + semeter.id, semeter);
  }

  public Delete(id:Number):Observable<Semeterepones>
  {
    return this.http.delete<Semeterepones>(this.api.apiUrl.semeter_delete+ '?id=' + id);
  }

  




}

