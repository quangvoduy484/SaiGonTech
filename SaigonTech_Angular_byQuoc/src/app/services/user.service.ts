import { Injectable } from '@angular/core';
import { ApiService } from './api.service';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface LoginResponse{
  errorCode: number;
  data: LoginInfo;
  messege: string;
}
export interface LoginInfo{
  id: number;
  userName: string;
  token: string;
}
@Injectable({
  providedIn: 'root'
})
export class UserService {

  constructor(private api: ApiService, private http: HttpClient) { }

  login(userName: string, passWord: string): Observable<LoginResponse>{
    const requestData = {
      username: userName,
      password: passWord
    };
    return this.http.post<LoginResponse>(this.api.apiUrl.login + '/login', requestData);
  }
}
