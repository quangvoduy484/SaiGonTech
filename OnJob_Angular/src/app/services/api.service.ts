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
    semeter_object: this.baseUrl + 'Semeter/GetObjectSemeter',
    semeter_add: this.baseUrl + 'Semeter/AddSemeter',
    semeter_update: this.baseUrl + 'Semeter/Update',
    semeter_delete:this.baseUrl + 'Semeter/Delete',
    candidatetypes: this.baseUrl + 'candidatetypes',
    stages: this.baseUrl + 'stages'
  }
}
