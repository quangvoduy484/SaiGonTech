import { Injectable } from '@angular/core';
import { ApiService } from './api.service';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface LoginResponse {
  errorcode: number;
  errmessage: string;
  data: LoginInfo;

}

export interface LoginInfo {
  id: number;
  username: string;
  name: string;
  token: string;
}
@Injectable({
  providedIn: 'root'
})
export class UserService {

  constructor(private api: ApiService, private http: HttpClient) { }

  userLogin(user: string, pass: string): Observable<LoginResponse> {
    const parm = {
      username: user,
      password: pass
    };
    return this.http.post<LoginResponse>(this.api.apiUrl.user_login, parm);
  }
}
