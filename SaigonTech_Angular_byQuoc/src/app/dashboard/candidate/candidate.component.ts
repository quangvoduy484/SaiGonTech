import { Component, OnInit, ViewChild } from '@angular/core';
import { Candidates, CandidateService } from '../../services/candidate.service';
import { Countries, AddressService } from '../../services/address.service';
import { Title } from '@angular/platform-browser';
import { BsModalRef, ModalDirective } from 'ngx-bootstrap';
import { DocumentService, Documents, DocumentByStudent, DocumentByCanidateId } from 'src/app/services/document.service';

@Component({
  selector: 'app-candidate',
  templateUrl: './candidate.component.html',
  styleUrls: ['./candidate.component.css']
})
export class CandidateComponent implements OnInit {

  candidates: Candidates[] = [];
  candidate: Candidates = {} as Candidates;


  public document: Documents = {} as Documents;
  public documents: Documents[] = [];

  public DocumentByStudents: DocumentByCanidateId[] = [];
  public DocumentByStudent: DocumentByCanidateId = {} as DocumentByCanidateId;

  inputType = 1;
  countries: Countries[] = [];
  country: Countries = {} as Countries;
  @ViewChild('modal') modalDocument: ModalDirective;
  constructor(private titleService: Title, private candidateService: CandidateService, private documentService: DocumentService, private countryService: AddressService) { }

  ngOnInit() {
    this.titleService.setTitle(" Candidate ");
    this.loadData();
  }

  public loadData() {
    this.candidateService.getAllCandidate().subscribe(result => {
      console.log(result);
      this.candidates = result.data;
    });
  }

  async documentCandidate(event, id: number) {
    console.log(id);
    if (event) {
      event.preventDefault();
    }

    this.candidateService.getCandidateId(id).subscribe(candidate => {
      if (candidate.errorCode === 1) {
        this.candidate = candidate.data;
      }
      console.log(this.candidate);

    });

    await this.documentService.getAllDocument().subscribe(document => {
      this.documents = document.data;
      console.log(this.documents);
    });

    this.setDocumentByStudent();
    this.modalDocument.show();
  }


  setDocumentByStudent() {
    this.documentService.getDocumentCandidateId(this.candidate.id).subscribe(documentStudent => {
      this.DocumentByStudents = documentStudent.data;
    });
  }


}
