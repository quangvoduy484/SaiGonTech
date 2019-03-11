import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { ApiService } from './api.service';
import { Observable } from 'rxjs';

// Majors
export interface Majors {
  Id: number;
  MajorName: string;
}

export interface MajorsResponse {
  errorCode: number;
  messege: string;
  data: Majors[];
}

export interface MajorDetail {
  errorCode: number;
  messege: string;
  data: Majors;
}

// ExamSubjects
export interface ExamSubjects {
  Id: number;
  ExamName: string;
  major: Majors;
}

export interface ExamSubjectsResponse {
  errorCode: number;
  messege: string;
  data: ExamSubjects[];
}

export interface ExamSubjectDetail {
  errorCode: number;
  messege: string;
  data: ExamSubjects;
}

@Injectable({
  providedIn: 'root'
})
export class ScoreofexamsubjectService {

  constructor(private api: ApiService, private http: HttpClient) { }

  // Event MAJOR
  public getAllMajors(): Observable<MajorsResponse>{
    return this.http.get<MajorsResponse>(this.api.apiUrl.majors);
  }

  public addMajor(datas: Majors): Observable<MajorDetail>{
    return this.http.post<MajorDetail>(this.api.apiUrl.majors, datas);
  }

  public updateMajor(datas: Majors): Observable<MajorDetail>{
    return this.http.put<MajorDetail>(this.api.apiUrl.majors + '/' + datas.Id, datas);
  }

  public deleteMajor(id): Observable<MajorDetail>{
    return this.http.delete<MajorDetail>(this.api.apiUrl.majors + '/' + id);
  }

  public getMajorId(id): Observable<MajorDetail>{
    return this.http.get<MajorDetail>(this.api.apiUrl.majors + "/" + id);
  }

  // EVENT EXAMSUBJECT
  public getAllExamSubject(): Observable<ExamSubjectsResponse> {
    return this.http.get<ExamSubjectsResponse>(this.api.apiUrl.examsubjects);
  }

  public getExamSubjectByMajor(major_id): Observable<ExamSubjectsResponse>{
    return this.http.get<ExamSubjectsResponse>(this.api.apiUrl.examsubjects + '/GetExamSubjectByMajor/' + major_id);
  }

  public addExamSubject(datas): Observable<ExamSubjectDetail>{
    return this.http.post<ExamSubjectDetail>(this.api.apiUrl.examsubjects, datas);
  }

  public updateExamSubject(datas: ExamSubjects): Observable<ExamSubjectDetail>{
    return this.http.put<ExamSubjectDetail>(this.api.apiUrl.examsubjects + '/' + datas.Id, datas);
  }

  public deleteExamSubject(id): Observable<ExamSubjectDetail>{
    return this.http.delete<ExamSubjectDetail>(this.api.apiUrl.examsubjects + '/' + id);
  }

  public getExamSubjectById(id): Observable<ExamSubjectDetail> {
    return this.http.get<ExamSubjectDetail>(this.api.apiUrl.examsubjects + '/' + id);
  }
}
