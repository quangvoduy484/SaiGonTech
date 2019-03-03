import { Injectable } from '@angular/core';
import { ApiService } from './api.service';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface ExSubjectsResponse{
  errorCode: number;
  messege: string;
  data: ExSubject[];
}

export interface ExSubjectDetail{
  errorCode: number;
  messege: string;
  data: ExSubject;
}

export interface ExSubject{
  id: number;
  examName: string;
}
@Injectable({
  providedIn: 'root'
})
export class ExamsubjectService {

  constructor(private api: ApiService, private http: HttpClient) { }

  public getAllExSubject():Observable<ExSubjectsResponse>{
    return this.http.get<ExSubjectsResponse>(this.api.apiUrl.examsubjects);
  }

  public add(datas: ExSubject):Observable<ExSubjectDetail>{
    return this.http.post<ExSubjectDetail>(this.api.apiUrl.examsubjects, datas);
  }

  public update(datas: ExSubject):Observable<ExSubjectDetail>{
    return this.http.put<ExSubjectDetail>(this.api.apiUrl.examsubjects + '/' + datas.id, datas);
  }

  public delete(id):Observable<ExSubjectDetail>{
    return this.http.delete<ExSubjectDetail>(this.api.apiUrl.examsubjects + '/' + id);
  }

  public getExSubjectId(id):Observable<ExSubjectDetail>{
    return this.http.get<ExSubjectDetail>(this.api.apiUrl.examsubjects + "/" + id);
  }
}
