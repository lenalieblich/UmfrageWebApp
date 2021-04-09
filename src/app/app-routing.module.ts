import {NgModule} from '@angular/core';
import {Routes, RouterModule} from '@angular/router';
import {QuestionsComponent} from './pages/questions/questions.component';
import {EvaluationComponent} from './pages/evaluation/evaluation.component';
import {StartComponent} from './pages/start/start.component';


const routes: Routes = [
  {path: 'questions', component: QuestionsComponent},
  {path: 'evaluation', component: EvaluationComponent},
  {path: 'start', component: StartComponent},
  {path: '**', component: StartComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule {
}
