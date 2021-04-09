import {Component, OnInit} from '@angular/core';
import {ChartOptions, ChartType, ChartDataSets} from 'chart.js';
import {AuthService} from '../../services/auth-service.service';
import {AnswerEvaluation, Evaluation} from '../../model/evaluation';
import {Question} from '../../model/question';
import {Message} from '../../model/message';
import {Label} from 'ng2-charts';

@Component({
  selector: 'app-evaluation',
  templateUrl: './evaluation.component.html',
  styleUrls: ['./evaluation.component.css']
})
export class EvaluationComponent implements OnInit {

  questionArray: Question[];
  evaluationArray: Evaluation[];

  barChartOptions: ChartOptions = {
    responsive: true,
  };

  barChartType: ChartType = 'bar';
  barChartLegend = true;
  barChartPlugins = [];

  constructor(private authServ: AuthService) {
  }

  ngOnInit() {
    this.getEvaluationData();
    this.evaluationArray = [];
  }


  getEvaluationData() {

    const response = JSON.stringify({command: 'getEvaluation'});

    this.authServ.postUserData(response)
      .subscribe((data: any) => {
        if (data.success === true) {
          this.questionArray = data.myList;


          this.questionArray.forEach(question => {

              const answerText = [];
              const answerCount = [];
              const answerInput = [];
              let chartData: ChartDataSets[];

              question.evaluation.forEach(evaluation => {
                  answerText.push(evaluation.answerText);
                  answerCount.push(evaluation.answerCount);
                  chartData = [{data: answerCount, label: 'Answers'}];
                  if (evaluation.userInput.length >= 1) {
                    answerInput.push(evaluation.userInput);
                  }
                }
              );
              const eva: Evaluation = {
                answerData: chartData,
                answerLabel: answerText,
                questionText: question.questionText,
                userInput: answerInput
              };
              this.evaluationArray.push(eva);
            }
          );
        }
      });
  }
}
