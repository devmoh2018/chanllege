import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { DashboardComponent } from './dashboard.component';
import { TaskSearchComponent } from '../task-search/task-search.component';

import { RouterTestingModule } from '@angular/router/testing';
import { of } from 'rxjs';
import { Tasks } from '../mock-heroes';
import { TaskService } from '../task.service';

describe('DashboardComponent', () => {
  let component: DashboardComponent;
  let fixture: ComponentFixture<DashboardComponent>;
  let heroService;
  let getHeroesSpy;

  beforeEach(async(() => {
    task = jasmine.createSpyObj('TaskService', ['getTasks']);
    getHeroesSpy = heroService.getHeroes.and.returnValue( of(HEROES) );
    TestBed.configureTestingModule({
      declarations: [
        DashboardComponent,
        HeroSearchComponent
      ],
      imports: [
        RouterTestingModule.withRoutes([])
      ],
      providers: [
        { provide: HeroService, useValue: heroService }
      ]
    })
    .compileComponents();

  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(DashboardComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should be created', () => {
    expect(component).toBeTruthy();
  });

  it('should display "Top Heroes" as headline', () => {
    expect(fixture.nativeElement.querySelector('h3').textContent).toEqual('Top Heroes');
  });

  it('should call heroService', async(() => {
    expect(getHeroesSpy.calls.any()).toBe(true);
    }));

  it('should display 4 links', async(() => {
    expect(fixture.nativeElement.querySelectorAll('a').length).toEqual(4);
  }));

});
