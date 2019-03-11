import { TestBed } from '@angular/core/testing';

import { ScoreofexamsubjectService } from './scoreofexamsubject.service';

describe('ScoreofexamsubjectService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: ScoreofexamsubjectService = TestBed.get(ScoreofexamsubjectService);
    expect(service).toBeTruthy();
  });
});
