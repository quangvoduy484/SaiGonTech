import { Component, OnInit } from '@angular/core';
import { CookieService } from 'ngx-cookie-service';
import * as jwtDecode from 'jwt-decode';
import { UserService, User } from '../services/user.service';
import { Router } from '@angular/router';
@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {

  constructor(private cookieService: CookieService, private userService: UserService, private router: Router) { }
  public decoded: any;
  public claim: any;
  public statusClaim = null;
  public  user: User = {} as User;
  ngOnInit() {
    this.getClaim();
    // hỏi ông thầy chỗ này
    this.infomationAcount(parseInt( localStorage.getItem('id')));
    console.log(this.user.userName);
  }

  getClaim() {
    this.decoded = this.getDecodedAccessToken(this.cookieService.get('token'));
    console.log(this.decoded);

    this.claim = this.decoded['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name'];
    if (this.claim === 'admin') {
      console.log('1');
    } else {
      console.log('2');
      this.statusClaim = '';
      console.log(this.statusClaim);
    }

  }

  getDecodedAccessToken(token: string): any {
    try {
      return jwtDecode(token);
    } catch (Error) {
      return null;
    }
  }

  infomationAcount(id: number) {
    this.userService.getAcount(id).subscribe(acount => {
      this.user = acount;
      console.log(this.user);
    });

  }

  logOut()
  {
    localStorage.setItem('id', '');
    localStorage.setItem('loggedIn', '');
    this.cookieService.delete('token');
    this.cookieService.delete('Id');
    if ( localStorage.getItem('loggedIn') === '')
    {
      this.router.navigate(['/login']);
    }
  }
}