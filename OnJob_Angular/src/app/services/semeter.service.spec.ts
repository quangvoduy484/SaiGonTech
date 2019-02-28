import { TestBed } from '@angular/core/testing';

import { SemeterService } from './semeter.service';

describe('SemeterService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: SemeterService = TestBed.get(SemeterService);
    expect(service).toBeTruthy();
  });
});
