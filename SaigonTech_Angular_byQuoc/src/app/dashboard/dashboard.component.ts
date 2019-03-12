import { Component, OnInit } from '@angular/core';
import { CookieService } from 'ngx-cookie-service';
import * as jwtDecode from 'jwt-decode';
@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {

  constructor(private cookieService: CookieService) { }
  decoded: any;
  admin:any;
  ngOnInit() {

    this.decoded = this.getDecodedAccessToken(this.cookieService.get('token'));
    console.log(this.decoded);
  
    this.admin = this.decoded["http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name"];
  }

  getDecodedAccessToken(token: string): any {
    try {
      return jwtDecode(token);
    }
    catch (Error) {
      return null;
    }
  }




}
