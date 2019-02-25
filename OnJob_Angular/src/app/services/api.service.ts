import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class ApiService {

  constructor() { }

  baseUrl = 'https://localhost:44332/api/';
  apiUrl = {
    years: this.baseUrl + 'years',
    yeardetail: this.baseUrl + 'years',
    semeter: this.baseUrl + 'Semeter/GetListSemeter',
    semeter_add: this.baseUrl + 'AddSemeter'

  }
}
