import {Label} from 'ng2-charts';
import {ChartDataSets} from 'chart.js';

export interface AnswerEvaluation {
  answerText: string;
  answerCount: number;
  userInput: string[];
}

export interface Evaluation {
  questionText: string;
  answerLabel: Label[];
  answerData: ChartDataSets[];
  userInput: string[];
}
