import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { PathLocationStrategy, LocationStrategy } from '@angular/common';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { QuestionsComponent } from './pages/questions/questions.component';
import { HttpClientModule } from '@angular/common/http';
import { AuthService } from './services/auth-service.service';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatStepperModule, MatFormFieldModule, MatInputModule, MatButtonModule} from '@angular/material';
import { ReactiveFormsModule } from '@angular/forms';
import { JwtHelperService, JWT_OPTIONS  } from '@auth0/angular-jwt';
import { FormsModule } from '@angular/forms';
import { EvaluationComponent } from './pages/evaluation/evaluation.component';
import { ChartsModule } from 'ng2-charts';
import { StartComponent } from './pages/start/start.component';


@NgModule({
  declarations: [
    AppComponent,
    QuestionsComponent,
    EvaluationComponent,
    StartComponent
  ],
  imports: [
    ChartsModule,
    MatButtonModule,
    MatInputModule,
    BrowserAnimationsModule,
    MatFormFieldModule,
    ReactiveFormsModule,
    MatStepperModule,
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    BrowserAnimationsModule,
    FormsModule
  ],
  exports: [
    MatInputModule,
    MatStepperModule,
    MatFormFieldModule,
    MatButtonModule,
  ],
  providers: [AuthService, { provide: JWT_OPTIONS, useValue: JWT_OPTIONS }, {provide: LocationStrategy, useClass: PathLocationStrategy},
    JwtHelperService],
  bootstrap: [AppComponent]
})
export class AppModule { }
