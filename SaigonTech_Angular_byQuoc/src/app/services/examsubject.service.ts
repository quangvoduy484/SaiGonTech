import { Injectable } from '@angular/core';
import { ApiService } from './api.service';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface ExamSubjectsResponse {
  errorCode: number;
  messege: string;
  data: ExamSubject[];
}

export interface ExamSubjectDetail {
  errorCode: number;
  messege: string;
  data: ExamSubject;
}

export interface ExamSubject {
  id: number;
  examName: string;
}
@Injectable({
  providedIn: 'root'
})
export class ExamSubjectService {

  constructor(private api: ApiService, private http: HttpClient) { }

  public getAllExamSubject(): Observable<ExamSubjectsResponse> {
    return this.http.get<ExamSubjectsResponse>(this.api.apiUrl.examsubjects);
  }

  public add(datas: ExamSubject): Observable<ExamSubjectDetail>{
    return this.http.post<ExamSubjectDetail>(this.api.apiUrl.examsubjects, datas);
  }

  public update(datas: ExamSubject): Observable<ExamSubjectDetail> {
    return this.http.put<ExamSubjectDetail>(this.api.apiUrl.examsubjects + '/' + datas.id, datas);
  }

  public delete(id): Observable<ExamSubjectDetail>{
    return this.http.delete<ExamSubjectDetail>(this.api.apiUrl.examsubjects + '/' + id);
  }

  public getExamSubjectById(id): Observable<ExamSubjectDetail>{
    return this.http.get<ExamSubjectDetail>(this.api.apiUrl.examsubjects + '/' + id);
  }
}
