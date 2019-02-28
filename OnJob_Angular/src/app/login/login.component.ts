import { Component, OnInit } from '@angular/core';
import { UserService } from '../services/user.service';
import { Router } from '@angular/router';
import { AuthService } from '../services/auth.service';


@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  username: string;
  password: string;
  message: string;
  constructor(private userserive: UserService, private router: Router, private auth: AuthService) { }

  ngOnInit() {
  }

  login() {
    this.userserive.userLogin(this.username, this.password).subscribe(us => {
      console.log(this.username, this.password);
      console.log(us.errorcode);
      if (us.errorcode === 1) {
        this.message = 'username or password wrong';
      } else {
        this.message = '';
        this.auth.setLoggedIn(true);
        this.router.navigate(['/dashboard']);
      }
    });

  }

}
