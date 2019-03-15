import { Component, OnInit } from '@angular/core';
import { Candidates, CandidateService } from '../../services/candidate.service';
import { Countries, AddressService } from '../../services/address.service';
import { Title } from '@angular/platform-browser';

@Component({
  selector: 'app-candidate',
  templateUrl: './candidate.component.html',
  styleUrls: ['./candidate.component.css']
})
export class CandidateComponent implements OnInit {

  candidates: Candidates[] = [];
  candidate: Candidates = {} as Candidates;

  countries: Countries[] = [];
  country: Countries = {} as Countries;
  constructor(private titleService: Title, private candidateService: CandidateService, private countryService: AddressService ) { }

  ngOnInit() {
    this.titleService.setTitle("Candidate");
    this.loadData();
  }

  public loadData(){
    this.candidateService.getAllCandidate().subscribe(result=>{
      console.log(result);
      this.candidates = result.data;
    })
  }
}
